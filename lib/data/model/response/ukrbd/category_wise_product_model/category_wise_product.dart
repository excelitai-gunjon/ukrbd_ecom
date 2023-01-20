

import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

class CategoryWiseProduct {
  CategoryWiseProduct({
      this.products,});

  CategoryWiseProduct.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
  }
  List<Products> products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

// class Productimages {
//   Productimages({
//     this.productsId,
//     this.image,});
//
//   Productimages.fromJson(dynamic json) {
//     productsId = json['products_id'];
//     image = json['image'];
//   }
//   int productsId;
//   String image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['products_id'] = productsId;
//     map['image'] = image;
//     return map;
//   }
//
// }


// class Products {
//
//   Products({
//     this.id,
//     this.productName,
//     this.price,
//     this.offerPrice,
//     this.productimages,});
//
//   Products.fromJson(dynamic json) {
//     id = json['id'];
//     productName = json['product_name'];
//     price = json['price'];
//     offerPrice = json['offer_price'];
//     if (json['productimages'] != null) {
//       productimages = [];
//       json['productimages'].forEach((v) {
//         productimages.add(Productimages.fromJson(v));
//       });
//     }
//   }
//   int id;
//   String productName;
//   String price;
//   dynamic offerPrice;
//   List<Productimages> productimages;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['product_name'] = productName;
//     map['price'] = price;
//     map['offer_price'] = offerPrice;
//     if (productimages != null) {
//       map['productimages'] = productimages.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }