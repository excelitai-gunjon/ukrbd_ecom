
class Products {
  Products({
    this.id,
    this.productName,
    this.price,
    this.offerPrice,
    this.salesPrice,
    this.description,
    this.productimages,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    offerPrice = json['offer_price'];
    salesPrice = json['sales_price'];
    description = json['description'];
    if (json['productimages'] != null) {
      productimages = [];
      json['productimages'].forEach((v) {
        productimages.add(Productimages.fromJson(v));
      });
    }
  }
  int id;
  String productName;
  String price;
  int offerPrice;
  String salesPrice;
  String description;
  List<Productimages> productimages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_name'] = productName;
    map['price'] = price;
    map['offer_price'] = offerPrice;
    map['sales_price'] = salesPrice;
    map['description'] = description;
    if (productimages != null) {
      map['productimages'] = productimages.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Productimages {
  Productimages({
    this.id,
    this.productsId,
    this.image,});

  Productimages.fromJson(dynamic json) {
    id = json['id'];
    productsId = json['products_id'];
    image = json['image'];
  }
  int id;
  int productsId;
  String image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['products_id'] = productsId;
    map['image'] = image;
    return map;
  }

}