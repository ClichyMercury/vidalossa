import 'package:json_annotation/json_annotation.dart';
import 'package:vidalossa/models/product.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Product {
  int count = 0;
  Cart(String title, double price, String id, String description, String image,
      String category, this.count)
      : super(category, title, description, image, category, price);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
