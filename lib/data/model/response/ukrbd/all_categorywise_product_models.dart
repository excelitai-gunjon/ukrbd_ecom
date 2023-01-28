import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

class AllCategoryWiseProductModel {
  List<AllCategoryWiseProduct> allCategoryWiseProduct;

  AllCategoryWiseProductModel({this.allCategoryWiseProduct});

  AllCategoryWiseProductModel.fromJson(Map<String, dynamic> json) {
    if (json['AllCategoryWiseProduct'] != null) {
      allCategoryWiseProduct = <AllCategoryWiseProduct>[];
      json['AllCategoryWiseProduct'].forEach((v) {
        allCategoryWiseProduct.add(new AllCategoryWiseProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCategoryWiseProduct != null) {
      data['AllCategoryWiseProduct'] =
          this.allCategoryWiseProduct.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCategoryWiseProduct {
  dynamic id;
  dynamic itemType;
  dynamic image;
  List<Products> products;

  AllCategoryWiseProduct({this.id, this.itemType, this.image, this.products});

  AllCategoryWiseProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemType = json['item_type'];
    image = json['image'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_type'] = this.itemType;
    data['image'] = this.image;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Products {
//   dynamic id;
//   dynamic productName;
//   dynamic price;
//   dynamic offerPrice;
//   List<Productimages>? productimages;
//
//   Products(
//       {this.id,
//         this.productName,
//         this.price,
//         this.offerPrice,
//         this.productimages});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productName = json['product_name'];
//     price = json['price'];
//     offerPrice = json['offer_price'];
//     if (json['productimages'] != null) {
//       productimages = <Productimages>[];
//       json['productimages'].forEach((v) {
//         productimages!.add(new Productimages.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_name'] = this.productName;
//     data['price'] = this.price;
//     data['offer_price'] = this.offerPrice;
//     if (this.productimages != null) {
//       data['productimages'] =
//           this.productimages!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Productimages {
//   dynamic id;
//   dynamic productsId;
//   dynamic image;
//
//   Productimages({this.id, this.productsId, this.image});
//
//   Productimages.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productsId = json['products_id'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['products_id'] = this.productsId;
//     data['image'] = this.image;
//     return data;
//   }
// }
