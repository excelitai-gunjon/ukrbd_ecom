import 'Products.dart';

class CategoryWiseProduct {
  CategoryWiseProduct({
      this.products,});

  CategoryWiseProduct.fromJson(dynamic json) {
    products = json['products'] != null ? Products.fromJson(json['products']) : null;
  }
  Products products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products.toJson();
    }
    return map;
  }

}