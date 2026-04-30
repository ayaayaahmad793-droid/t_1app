import 'package:flutter/material.dart';

class PageItem {
  final String title;
  final Widget page;

  PageItem({required this.title, required this.page});
}

class DynamicSelectedPage extends StatelessWidget {
  final String selectedText;
  final List<PageItem> items;

  const DynamicSelectedPage({
    super.key,
    required this.selectedText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return items.firstWhere((item) => item.title == selectedText).page;
    } catch (e) {
      return items.first.page; // default
    }
  }
}
