import 'package:flutter/material.dart';

class CategoryModal {
  String? image;
  String? category;
  int? discount;
  Widget? page;

  CategoryModal({this.image, this.category, this.discount, this.page});

  CategoryModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    category = json['category'];
    discount = json['discount'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['category'] = this.category;
    data['discount'] = this.discount;
    data['page'] = this.page;
    return data;
  }
}
