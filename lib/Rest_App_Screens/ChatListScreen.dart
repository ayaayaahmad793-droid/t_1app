import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_1app/Rest_App_Screens/ChatController.dart';
import 'package:t_1app/Rest_App_Screens/ChatDetailsScreen.dart';

class ChatListScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.0, // ارتفاع مناسب
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF54E35B), Color(0xFF2E7D32)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(
          "الرسائل",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // شريط البحث
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 20),
            child: TextField(
              onChanged: (value) => controller.filterChats(value),
              decoration: InputDecoration(
                hintText: "ابحث عن محادثة...",
                hintStyle: TextStyle(fontSize: 17),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Colors.green),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // قائمة المحادثات (داخل Expanded لضمان عدم الاختفاء)
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.filteredList.length,
              itemBuilder: (context, index) {
                var chat = controller.filteredList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF54E35B),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    chat["name"].toString(),
                    style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat["message"].toString(),
                    style: GoogleFonts.cairo(fontSize: 13, color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    chat["time"].toString(),
                    style: GoogleFonts.cairo(fontSize: 11, color: Colors.grey),
                  ),
                  onTap: () => Get.to(() => ChatDetailsScreen(
                    chatId: chat["id"].toString(),
                    name: chat["name"].toString(),
                  )),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}