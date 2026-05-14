class ExchangeItem {
  final String title;
  final String description;
  final String image;
  bool isFavorite;
  ExchangeItem({
    required this.title,
    required this.description,
    required this.image,
    this.isFavorite = false,
  });
}

List<ExchangeItem> items = [
  ExchangeItem(
    title: "قميص أخضر سادة للتبادل",
    description: "أرغب بتبديله ببنطال",
    image: "images/exchangeItem2.png",
  ),
  ExchangeItem(
    title: "أربع كتب مميزة للتبادل",
    description: "اريد التبادل بكتب تطوير أو تصميم",
    image: "images/exchangeItem1.png",
  ),
  ExchangeItem(
    title: "صندل مناسبات مزخرف",
    description: "للتبادل بحذاء مريح",
    image: "images/exchangeItem4.png",
  ),
  ExchangeItem(
    title: "بوت عملي ومريح لتبادل ",
    description: "للتبادل بقميص للافراح",
    image: "images/exchangeItem3.png",
  ),
  ExchangeItem(
    title: "قميص أخضر سادة للتبادل",
    description: "أرغب بتبديله ببنطال",
    image: "images/exchangeItem2.png",
  ),
  ExchangeItem(
    title: "أربع كتب مميزة للتبادل",
    description: "اريد التبادل بكتب تطوير أو تصميم",
    image: "images/exchangeItem1.png",
  ),
];
