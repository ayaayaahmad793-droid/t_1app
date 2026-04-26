import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Color(0xff2E7D32),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(Icons.home, "الرئيسية", 0),
          navItem(Icons.favorite_border, "المفضلة", 1),
          navItem(Icons.shopping_cart_outlined, "السلة", 2),
          navItem(Icons.grid_view, "الأقسام", 3),
          navItem(Icons.person_outline, "الحساب", 4),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String label, int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  نحرك الأيقونة فقط
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.translationValues(0, isSelected ? -22 : 0, 0),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white,
              size: 22,
            ),
          ),

          const SizedBox(height: 4),

          //  النص ثابت
          Text(label, style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
