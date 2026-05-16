import 'package:flutter/material.dart';
import 'package:t_1app/models/home_world_model.dart';
import 'package:t_1app/screens/Giveyourgoodness_page.dart';
import 'package:t_1app/screens/HomePage.dart';
import 'package:t_1app/screens/HomeWorld.dart';

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
    title: "عالم الملابس ",
    subtitle: "نسائي , رجالي , اطفال",
    image: "images/dep2.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "الحياة اليومية",
    subtitle: "طعام , تنظيف , مستلزمات",
    image: "images/dep3.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "تكنولوجيا",
    subtitle: "هواتف , لابتوبات , ملحقات ",
    image: "images/dep4.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "عالم الخير (التبرع) ",
    subtitle: "التبرع للناس المحتاجة",
    image: "images/dep5.png",
    page: GiveyourgoodnessPage(), //
  ),
];
