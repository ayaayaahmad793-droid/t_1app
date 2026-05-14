class GoodnessdetailsModel {
  final String productName;
  final String longDescription;
  final String productImage;
  final String note;
  final String location;



  GoodnessdetailsModel({
    required this.productName,
    required this.productImage,
    required this.longDescription,
    required this.note,
    required this.location,
   
  });
}
List<GoodnessdetailsModel> products = [
  GoodnessdetailsModel(
    productName: "بيجامة صيفية",
    productImage: "images/uniqeProductAll1.png",
    location: "مكان التبرع : قطاع غزة _ دير البلح",
    note: "ملاحظة: يوجد سعر رمزي بسيط في حال طلب التوصيل إلى موقعك، ويختلف حسب المنطقة",
   longDescription: "بيجامة صيفية سوداء بمقاس متوسط (M)، خفيفة ومريحة، مستعملة قليلاً وبحالة جيدة، مناسبة للتبرع لمحبي الراحة والأناقة",
  ),
  GoodnessdetailsModel(
    productName: "بيجامة صيفية",
    productImage: "images/uniqeProductAll1.png",
    location: "مكان التبرع : قطاع غزة _ دير البلح",
    note:
        "ملاحظة: يوجد سعر رمزي بسيط في حال طلب التوصيل إلى موقعك، ويختلف حسب المنطقة",
    longDescription:
        "بيجامة صيفية سوداء بمقاس متوسط (M)، خفيفة ومريحة، مستعملة قليلاً وبحالة جيدة، مناسبة للتبرع لمحبي الراحة والأناقة",
  ),
   GoodnessdetailsModel(
    productName: "بيجامة صيفية",
    productImage: "images/uniqeProductAll1.png",
    location: "مكان التبرع : قطاع غزة _ دير البلح",
    note:
        "ملاحظة: يوجد سعر رمزي بسيط في حال طلب التوصيل إلى موقعك، ويختلف حسب المنطقة",
    longDescription:
        "بيجامة صيفية سوداء بمقاس متوسط (M)، خفيفة ومريحة، مستعملة قليلاً وبحالة جيدة، مناسبة للتبرع لمحبي الراحة والأناقة",
  ),

 
];

