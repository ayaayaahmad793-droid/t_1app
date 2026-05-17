import 'package:flutter/material.dart';
import 'package:t_1app/screens/EverydayLifePage.dart';
import 'package:t_1app/screens/Giveyourgoodness_page.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/HomeWorld.dart';
import 'package:t_1app/screens/MakeupAndClothesPage.dart';
import 'package:t_1app/screens/TechnologyPage.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final String image;
  final Widget page; //  الصفحة المرتبطة

  CategoryModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.page,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
    title: " عالم البيت ",
    subtitle: "اثاث , ادوات منزلية ",
    image: "images/dep1.png",
    page: Homeworld(), //
  ),
  CategoryModel(
    title: "عالم الملابس والمكياج ",
    subtitle: "نسائي , رجالي , اطفال",
    image: "images/dep2.png",
    page: Makeupandclothespage(),
  ),
  CategoryModel(
    title: "الحياة اليومية",
    subtitle: "طعام , تنظيف , مستلزمات",
    image: "images/dep3.png",
    page: Everydaylifepage(), //
  ),
  CategoryModel(
    title: "تكنولوجيا",
    subtitle: "هواتف , لابتوبات , ملحقات ",
    image: "images/dep4.png",
    page: Technologypage(), //
  ),
  CategoryModel(
    title: "عالم الخير (التبرع) ",
    subtitle: "التبرع للناس المحتاجة",
    image: "images/dep5.png",
    page: GiveyourgoodnessPage(), //
  ),
];
