import 'package:flutter/material.dart';
import 'package:t_1app/Htest.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  List<Widget> page = [
    Homepage(),
    Text("fav"),
    Text("fav"),
    Text("fav"),
    Text("fav"),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "settings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_off_outlined),
              label: "Home",
            ),
          ],
        ),
        // body: Container(),
      ),
    );
  }
}
