import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

class SubCategoryWiseProductModel {
  SubCategoryWiseProductModel({
    this.products,});

  SubCategoryWiseProductModel.fromJson(dynamic json) {
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

// class Products {
//   Products({
//     this.id,
//     this.stock,
//     this.productName,
//     this.price,
//     this.offerPrice,
//     this.salesPrice,
//     this.brand,
//     this.categoriesId,
//     this.subcategoriesId,
//     this.description,
//     this.productimages,});
//
//   Products.fromJson(dynamic json) {
//     id = json['id'];
//     stock = json['stock'];
//     productName = json['product_name'];
//     price = json['price'];
//     offerPrice = json['offer_price'];
//     salesPrice = json['sales_price'];
//     brand = json['brand'];
//     categoriesId = json['categories_id'];
//     subcategoriesId = json['subcategories_id'];
//     description = json['description'];
//     if (json['productimages'] != null) {
//       productimages = [];
//       json['productimages'].forEach((v) {
//         productimages.add(Productimages.fromJson(v));
//       });
//     }
//   }
//   int id;
//   dynamic stock;
//   String productName;
//   String price;
//   int offerPrice;
//   String salesPrice;
//   String brand;
//   int categoriesId;
//   int subcategoriesId;
//   String description;
//   List<Productimages> productimages;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['stock'] = stock;
//     map['product_name'] = productName;
//     map['price'] = price;
//     map['offer_price'] = offerPrice;
//     map['sales_price'] = salesPrice;
//     map['brand'] = brand;
//     map['categories_id'] = categoriesId;
//     map['subcategories_id'] = subcategoriesId;
//     map['description'] = description;
//     if (productimages != null) {
//       map['productimages'] = productimages.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }

// class Productimages {
//   Productimages({
//     this.id,
//     this.productsId,
//     this.image,});
//
//   Productimages.fromJson(dynamic json) {
//     id = json['id'];
//     productsId = json['products_id'];
//     image = json['image'];
//   }
//   int id;
//   int productsId;
//   String image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['products_id'] = productsId;
//     map['image'] = image;
//     return map;
//   }
//
// }