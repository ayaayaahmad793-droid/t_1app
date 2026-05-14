import 'package:flutter/material.dart';
import 'package:t_1app/screens/exchangePage.dart';

class DonateCardModel {
  final String title;
  final String subTitle;
  final String image;
  final Widget page;

  DonateCardModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.page,
  });
}

List<DonateCardModel> donateCards = [
  DonateCardModel(
    title: "كتب جاهزة للقراءة",
    subTitle: "كتب متنوعة بحالة ممتازة، يمكن الاستفادة منها فوراً",
    image: "images/goodness1.png",
    page: Exchange(),
  ),

  DonateCardModel(
    title: "بيجامة صيفية",
    subTitle: "بيجامة صيفية خفيفة ومريحة بحالة شبه جديدة",
    image: "images/goodness2.png",
    page: Exchange(),
  ),

  DonateCardModel(
    title: "شنطة البني الكلاسيكية",
    subTitle: "شنطة طويلة بنية، عملية وبحالة جيدة جدًا",
    image: "images/goodness3.png",
    page: Exchange(),
  ),
  DonateCardModel(
    title: "شنطة يومية للبنات",
    subTitle: "شنطة زرقاء أنيقة، مناسبة لبنات الجامعة وبحالة ممتازة",
    image: "images/goodness4.png",
    page: Exchange(),
  ),
  DonateCardModel(
    title: "طقم كاجوال شتوي أنيق",
    subTitle: "طقم جينز وبلوزة بيضاء شتوية، بحالة جيدة وجاهز للاستعمال",
    image: "images/goodness5.png",
    page: Exchange(),
  ),
];
