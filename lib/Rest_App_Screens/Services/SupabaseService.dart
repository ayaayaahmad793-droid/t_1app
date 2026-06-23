import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // دالة لإنشاء بروفايل المستخدم يدوياً في جدول profiles
  Future<void> createUserProfile({
    required String userId,
    required String fullName,
    required String phone,
    int accountType = 0,
  }) async {
    try {
      await _client.from('profiles').insert({
        'id': userId,
        'full_name': fullName,
        'phone': phone,
        'account_type': accountType,
      });
    } catch (e) {
      print("Error creating user profile: $e");
      throw Exception("Failed to save user profile details");
    }
  }
}