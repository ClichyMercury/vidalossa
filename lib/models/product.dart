import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String title;
  double price;
  String id;
  String description;
  String image;

  @JsonKey(defaultValue: '')
  String category;

  Product(this.title, this.category, this.description, this.id, this.image,
      this.price);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
