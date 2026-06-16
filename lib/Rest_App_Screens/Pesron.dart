import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/Rest_App_Screens/Person_Controller.dart';
import 'package:t_1app/screens/CartPage.dart';
import 'package:t_1app/screens/FavPage.dart';
import 'package:t_1app/screens/OrderDetails_page.dart';
import 'package:t_1app/screens/department.dart';
import 'package:t_1app/widgets/NavigationBar.dart'; // تأكدي من استيراد الـ NavBar
import 'package:t_1app/screens/HomePage.dart'; // تأكدي من استيراد الصفحة الرئيسية

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PersonController controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 4;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: const IconButton(
        //     onPressed: null,
        //     icon: Icon(Icons.arrow_back_ios, color: Colors.black)
        // ),
        actions: [
          IconButton(
            icon: Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(Icons.arrow_back_ios),
            ),
            onPressed: () => Get.back(),
          ),
        ],
        title: Text(
          "الحساب الشخصي",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userName.value,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          controller.userEmail.value,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          controller.userPhone.value,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Items
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  _buildMenuItem(
                    "طلباتي",
                    Icons.arrow_back_ios,
                    onTap: () => Get.to(() => OrderDetailsPage()),
                  ),
                  _buildMenuItem(
                    "طلبات التبادل",
                    Icons.arrow_back_ios,
                    onTap: () => Get.to(() => const EmptyResultsScreen()),
                  ),
                  _buildMenuItem(
                    "طلبات التبرع",
                    Icons.arrow_back_ios,
                    onTap: () => Get.to(() => const EmptyResultsScreen()),
                  ),
                  _buildMenuItem("اللغة", Icons.language),

                  Obx(
                    () => Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.notifications_none),
                          const SizedBox(width: 10),
                          Text(
                            "الاشعارات",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            controller.isNotificationsEnabled.value
                                ? "مفعلة"
                                : "غير مفعلة",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Switch(
                            value: controller.isNotificationsEnabled.value,
                            onChanged:
                                (val) => controller.toggleNotifications(val),
                            activeColor: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),

                  _buildMenuItem(
                    "عن التطبيق (سياسة الخصوصية، الشروط والأحكام)",
                    Icons.arrow_back_ios,
                  ),
                  _buildMenuItem(
                    "تسجيل الخروج",
                    Icons.logout,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,

                MaterialPageRoute(builder: (_) => Homepage()),
              );
              break;

            case 1:
              Navigator.pushReplacement(
                context,

                MaterialPageRoute(builder: (_) => Favpage()),
              );
              break;

            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Cartpage()),
              );
              break;

            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Department()),
              );
              break;

            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildMenuItem(
    String title,
    IconData icon, {
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 16,
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(icon, size: 23, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////

class EmptyResultsScreen extends StatelessWidget {
  const EmptyResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text(
          "لا يوجد نتائج حالياً",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
