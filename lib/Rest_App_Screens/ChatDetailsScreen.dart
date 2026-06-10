import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_1app/Rest_App_Screens/ChatController.dart';

class ChatDetailsScreen extends StatelessWidget {
  final String chatId;
  final String name;
  final ChatController controller = Get.find();
  final TextEditingController textController = TextEditingController();

  ChatDetailsScreen({required this.chatId, required this.name});

  @override
  Widget build(BuildContext context) {
    var messages = controller.getMessages(chatId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Color(0xFF54E35B), child: Icon(Icons.person, color: Colors.white)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.black, fontSize: 16)),
                Text("نشط الآن", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.call_outlined, color: Colors.black , size: 27,), onPressed: () {}),
          IconButton(icon: Icon(Icons.videocam_outlined, color: Colors.black, size: 27,), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.black, size: 27,), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isMe = messages[index]["sender"] == "me";
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe ? Color(0xff2E7D32) : Color(0xffEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                        bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
                      ),
                    ),
                    child: Text(messages[index]["text"]!,
                        style: TextStyle(color: isMe ? Colors.white : Colors.black , fontSize: 16) , ),
                  ),
                );
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 35),
            child: Row(
              children: [
                // زر الإرفاق (+)
                PopupMenuButton<String>(
                  color: Colors.white, // هنا قمنا بتغيير خلفية القائمة إلى الأبيض
                  icon: Icon(Icons.add, color: Colors.green),
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: "media",
                      child: ListTile(
                        leading: Icon(Icons.image_outlined, color: Colors.black), // أيقونة سوداء
                        title: Text("صورة او فيديو", style: TextStyle(color: Colors.black)), // نص أسود
                      ),
                    ),
                    PopupMenuItem(
                      value: "doc",
                      child: ListTile(
                        leading: Icon(Icons.description_outlined, color: Colors.black),
                        title: Text("مستند", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    PopupMenuItem(
                      value: "loc",
                      child: ListTile(
                        leading: Icon(Icons.location_on_outlined, color: Colors.black),
                        title: Text("موقع", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: "اكتب رسالة...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green),
                  onPressed: () {
                    controller.sendMessage(chatId, textController.text);
                    textController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}