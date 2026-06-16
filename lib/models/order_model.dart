import 'package:t_1app/models/cart_model.dart';

class OrderModel {
  final String orderNumber;
  final String deliveryMethod;
  final List<CartModel> products;
  final double subtotal;
  final double deliveryFee;
  final double total;

  OrderModel({
    required this.orderNumber,
    required this.deliveryMethod,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderNumber': orderNumber,
      'deliveryMethod': deliveryMethod,
      'products': products.map((e) => e.toJson()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderNumber: json['orderNumber'],
      deliveryMethod: json['deliveryMethod'],
      products:
          (json['products'] as List).map((e) => CartModel.fromJson(e)).toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );
  }
}
