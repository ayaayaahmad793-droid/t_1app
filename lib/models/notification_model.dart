class NotificationItem {
  final String icon;
  final String title;
  final String time;
  final String category;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.time,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {"icon": icon, "title": title, "time": time, "category": category};
  }

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      icon: json["icon"],
      title: json["title"],
      time: json["time"],
      category: json["category"],
    );
  }
}
