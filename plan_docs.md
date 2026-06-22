# Plan to Complete Application with Supabase Integration (`plan_docs.md`)

This document outlines the comprehensive engineering plan to transition the application from using static/local mock data to a fully functional real-time backend powered by **Supabase**.

---

## 1. Current Supabase Connection Status
In [main.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/main.dart), Supabase is already initialized using the following credentials:
* **Project URL:** `https://azxsryrryrdwxuuzlnqq.supabase.co`
* **Anon/Publishable Key:** Provided in `main.dart` and working.
* **Authentication Service:** [Auth_Supa.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/Rest_App_Screens/Services/Auth_Supa.dart) is partially configured with basic auth methods (`signIn`, `signUp`, `signOut`, `sendResetEmail`, `verifyOTP`, `updatePassword`).

---

## 2. Identified Bugs & Critical UI Code Fixes
Before implementing Supabase integrations, the following existing bugs in the Flutter code must be resolved:

1. **`AddProduct.dart` Input Binding Bug:**
   * **Issue:** [AddProduct.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/AddProduct.dart) declares controllers (`nameController`, `descController`, etc.) and a save payload relying on them, but **none of the `TextField` widgets have `controller` or `onChanged` bindings**. They are completely unbound, meaning no input is captured when submitting.
   * **Fix:** Bind `nameController` to the product name text field, `descController` to the short description text field, `priceController` to the price, `discountController` to the discount price, and `quantityController` to the quantity text fields.

2. **OTP Digit Length Discrepancy:**
   * **Issue:** [otp_provider.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/otp_provider.dart) defines `otp = ["", "", "", ""]` (4 digits) and its `clear` method resets it to 4 entries. However, [AuthCode.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/screens/AuthCode.dart) creates **6 text controllers** for OTP, and `otp_provider.dart` checks `if (code.length != 6) return false;`.
   * **Fix:** Update `otp_provider.dart` to initialize OTP array as `List.generate(6, (_) => "")` and align logic consistently with 6 digits.

3. **`verifyOTP` Type Discrepancy:**
   * **Issue:** In [Auth_Supa.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/Rest_App_Screens/Services/Auth_Supa.dart), comments recommend using `OtpType.email` instead of `OtpType.magiclink`, but the code executes `type: OtpType.magiclink`.
   * **Fix:** Ensure the verification type corresponds to how Supabase sends it (usually `OtpType.signup` or `OtpType.recovery` for reset password flow, and `OtpType.magiclink` for passwordless logins).

---

## 3. Database Schema Design (Supabase SQL)
Run the following DDL script in the **Supabase SQL Editor** to create the tables, indexes, and automatic triggers required for user profiles:

```sql
-- 1. Profiles Table (Extends Supabase Auth users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  full_name TEXT NOT NULL,
  phone TEXT,
  account_type INT DEFAULT 0, -- 0: Normal User, 1: Shopkeeper
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Automatically create profile on user registration trigger
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, phone, account_type)
  VALUES (
    new.id,
    COALESCE(new.raw_user_meta_data->>'full_name', ''),
    COALESCE(new.raw_user_meta_data->>'phone', ''),
    COALESCE((new.raw_user_meta_data->>'account_type')::int, 0)
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 2. Shops Table (Details for Shopkeepers)
CREATE TABLE public.shops (
  id UUID REFERENCES public.profiles(id) ON DELETE CASCADE PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  location TEXT NOT NULL,
  phone TEXT NOT NULL,
  logo_url TEXT,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- 3. Products Table
CREATE TABLE public.products (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  shop_id UUID REFERENCES public.shops(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  code TEXT,
  price NUMERIC NOT NULL,
  old_price NUMERIC,
  quantity INT DEFAULT 1,
  available BOOLEAN DEFAULT TRUE,
  image_url TEXT,
  category TEXT NOT NULL, -- "عالم البيت", "الحياة اليومية", etc.
  sub_category TEXT,       -- "مأكولات ومشروبات", "منتجات العناية", etc.
  rating NUMERIC DEFAULT 5.0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- 4. Favorites Table (Multi-Device Sync)
CREATE TABLE public.favorites (
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  product_id INT REFERENCES public.products(id) ON DELETE CASCADE NOT NULL,
  PRIMARY KEY (user_id, product_id)
);

-- 5. Addresses Table
CREATE TABLE public.addresses (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL, -- e.g., "المنزل", "العمل"
  city TEXT NOT NULL,
  street TEXT NOT NULL,
  phone TEXT NOT NULL,
  is_default BOOLEAN DEFAULT FALSE
);

-- 6. Orders Table
CREATE TABLE public.orders (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  order_number TEXT UNIQUE NOT NULL,
  delivery_method TEXT NOT NULL,
  subtotal NUMERIC NOT NULL,
  delivery_fee NUMERIC NOT NULL,
  total NUMERIC NOT NULL,
  status TEXT DEFAULT 'قيد التنفيذ' NOT NULL, -- 'قيد التنفيذ', 'مكتمل', 'غير مكتمل'
  address_id INT REFERENCES public.addresses(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- 7. Order Items Table
CREATE TABLE public.order_items (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id INT REFERENCES public.orders(id) ON DELETE CASCADE NOT NULL,
  product_id INT REFERENCES public.products(id) ON DELETE SET NULL,
  price NUMERIC NOT NULL,
  quantity INT NOT NULL
);

-- 8. Exchange Items Table (Items posted for user exchanges)
CREATE TABLE public.exchange_items (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  category TEXT NOT NULL,
  image_url TEXT,
  expected_exchange TEXT, -- What user wants in return
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- 9. Donations Table
CREATE TABLE public.donations (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  amount NUMERIC,
  type TEXT NOT NULL, -- "money", "items"
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- 10. Chats Table (For Conversation Management)
CREATE TABLE public.chats (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  shop_owner_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
  UNIQUE (user_id, shop_owner_id)
);

-- 11. Chat Messages Table
CREATE TABLE public.messages (
  id GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  chat_id UUID REFERENCES public.chats(id) ON DELETE CASCADE NOT NULL,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL NOT NULL,
  text TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 12. Storage Buckets Creation (Require Supabase Dash or Storage Policy SQL)
-- Buckets to enable: 'product-images', 'shop-logos', 'exchange-images'
```

---

## 4. Implementation Steps by Module

### Phase 1: Authentication & Account Roles
1. **User Meta Data Expansion:**
   * Update [register_provider.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/register_provider.dart) to send `account_type` inside the `signUp` data map.
   * On [AccountType.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/screens/AccountType.dart), update the user metadata in Supabase to save `account_type` (0 for normal, 1 for shopkeeper) so it gets populated in the `profiles` table.
2. **Routing based on Role on Start:**
   * In `main.dart`, read the authenticated user's profile from the database `public.profiles` to check their role:
     * If `account_type == 0` -> Route to `Homepage()`.
     * If `account_type == 1` -> Route to `TheShop()` (if shop is registered) or `ShopData()` (if shop is not registered).

### Phase 2: Shopkeeper Module Integration
1. **Save Shop Profile to Database:**
   * Refactor [shopData_provider.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/shopData_provider.dart):
     * Upload the logo image to Supabase Storage bucket `shop-logos`.
     * Insert/Upsert the shop details to the `shops` table.
     * Deprecate SharedPreferences for shop data.
2. **Product Uploading to Supabase:**
   * Fix input bindings in [AddProduct.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/AddProduct.dart).
   * Refactor the submission flow:
     * Upload the product image to `product-images` bucket.
     * Insert product row into `products` table, with `shop_id` mapped to the current authenticated seller UUID.
3. **Display Shop Stats & Orders:**
   * In [TheShop.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/screens/TheShop.dart):
     * Query `products` table for counts where `shop_id = current_user.id`.
     * Query `order_items` and `orders` to retrieve actual sales list.
   * In [TheProduct.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/TheProduct.dart):
     * Fetch products using `supabase.from('products').select().eq('shop_id', myId)`.
     * Allow deleting products directly from database via API call.

### Phase 3: E-Commerce Customer Feed
1. **Home Feed Refactoring:**
   * Refactor [home_product_provider.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/home_product_provider.dart):
     * Fetch all records from `products` table.
     * Categorize them dynamically: `newProducts` (sorted by date), `offers` (where `old_price > price`), `popular` (by rating).
   * Do the same for [DailyLifeProvider](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/daily_life_provider.dart), [HomeworldProvider](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/homeworld_provider.dart), [FashionProvider](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/fashion_provider.dart), etc.
2. **Synchronize Favorites:**
   * In `favorite_provider.dart`:
     * Read and write favorites by joining/editing rows in the `favorites` table in Supabase.
3. **Addresses Management:**
   * In [address_provider.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/address_provider.dart), make async calls to query, insert, and delete rows in the `addresses` table.
4. **Order Placement (Checkout):**
   * Refactor the "ادفع الان" action in [TheComplete_Order_page.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/screens/TheComplete_Order_page.dart):
     * Insert a row in the `orders` table.
     * Retrieve the generated `order_id`.
     * Insert each item in the cart into the `order_items` table.
     * Clear local cart state.

### Phase 4: Exchange and Donation Modules
1. **Exchange Platform:**
   * Refactor [exchange_provider.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/providers/exchange_provider.dart) to push exchanges to the `exchange_items` table and upload item photo to `exchange-images` bucket.
2. **Donation Management:**
   * Connect monetary donations to the `donations` table on confirmation.

### Phase 5: Real-time Messaging & Chat
1. **Create Chat Conversations:**
   * When clicking "تواصل مع البائع" on a product details page, check if a conversation exists in `chats` between `user_id` and `shop_owner_id`. If not, insert a conversation row.
2. **Real-time Chat screen:**
   * Refactor [ChatController.dart](file:///c:/Users/Roaa/StudioProjects/t_1app/lib/Rest_App_Screens/ChatController.dart) (GetX) to subscribe to real-time changes in `messages` where `chat_id = active_chat_id`.
   * Use Supabase real-time client channel:
     ```dart
     final myChannel = supabase.channel('room-1')
       .onPostgresChanges(
         event: PostgresChangeEvent.all,
         schema: 'public',
         table: 'messages',
         callback: (payload) {
           // Append new message to message list dynamically
         },
       ).subscribe();
     ```
   * Replace mock templates with queries to `public.chats` (for chat history overview) and `public.messages` (for specific threads).

---

## 5. Deployment & Security Rules (Row Level Security - RLS)
To secure client data in Supabase, configure Row Level Security (RLS) policies:

1. **`profiles`:** Read access allowed to all authenticated users. Edit access allowed only where `auth.uid() = id`.
2. **`shops`:** Read access allowed to all. Edit access allowed only where `auth.uid() = id`.
3. **`products`:** Read access allowed to all. Insert/Update/Delete allowed only if the user profile has `account_type = 1` and matches product owner `shop_id`.
4. **`chats` & `messages`:** Access allowed only to users who are members of that chat (`auth.uid() = user_id` OR `auth.uid() = shop_owner_id`).
5. **`orders`:** Read/Write allowed only for the placing user or the selling shopkeeper.

---

## 6. Suggested Verification Plan
1. **Auth & Setup Verification:**
   * Register a user, select "Normal User", inspect the Supabase database to verify the trigger successfully creates a row in `profiles` with metadata.
   * Log out, register another user, select "Shopkeeper", verify shop profile data saves correctly.
2. **Storage and CRUD Tests:**
   * Create a new product as a shopkeeper. Verify the image file uploads to Supabase Storage, and product fields populate in the SQL row.
   * View the Customer Feed on Homepage. Verify the newly created product displays correctly with the remote image.
3. **Real-time Chat Test:**
   * Open two instances (or emulator + physical device). Send messages back and forth to verify that message feeds update instantly without manual refreshing.
