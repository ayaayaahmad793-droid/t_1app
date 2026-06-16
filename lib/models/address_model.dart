class AddressModel {
  final String fullName;
  final String country;
  final String city;
  final String street;
  final String phone;

  AddressModel({
    required this.fullName,
    required this.country,
    required this.city,
    required this.street,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'country': country,
      'city': city,
      'street': street,
      'phone': phone,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      fullName: json['fullName'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      street: json['street'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
