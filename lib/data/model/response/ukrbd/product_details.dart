

import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

class ProductDetails {
  ProductDetails({
      this.products,});

  ProductDetails.fromJson(dynamic json) {
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