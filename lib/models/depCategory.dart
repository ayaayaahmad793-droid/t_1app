import 'package:flutter/material.dart';
import 'package:t_1app/screens/AccountType.dart';
import 'package:t_1app/HomePage.dart';

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
    title: "لوازم البيت",
    subtitle: "أثاث، أدوات منزلية",
    image: "images/dep1.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "عالم الملابس",
    subtitle: "ملابس، أحذية، إكسسوارات",
    image: "images/dep1.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "المواد التموينية",
    subtitle: "طعام، شراب، مستلزمات",
    image: "images/dep1.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "تكنولوجيا",
    subtitle: "موبايل، لابتوب، ملحقات",
    image: "images/dep1.png",
    page: Homepage(), //
  ),
  CategoryModel(
    title: "عالم الأطفال",
    subtitle: "ملابس، ألعاب، مستلزمات",
    image: "images/dep1.png",
    page: Accounttype(), //
  ),
];
