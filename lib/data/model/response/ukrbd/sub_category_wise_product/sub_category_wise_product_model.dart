


import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

class SubCategoryWiseProductModel {
  SubCategoryWiseProductModel({
      this.products,});

  SubCategoryWiseProductModel.fromJson(dynamic json) {
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



class Products {
  Products({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,});

  Products.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int currentPage;
  List<Data> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Links> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

// import 'Productimages.dart';
//
// class Data {
//   Data({
//     this.id,
//     this.productImage,
//     this.productName,
//     this.productCode,
//     this.purchasePrice,
//     this.price,
//     this.offerPrice,
//     this.salesPrice,
//     this.productStatus,
//     this.discount,
//     this.warranty,
//     this.guarantee,
//     this.brand,
//     this.tags,
//     this.countSale,
//     this.status,
//     this.stock,
//     this.category,
//     this.categoriesId,
//     this.subcategoriesId,
//     this.galleriesId,
//     this.description,
//     this.priority,
//     this.moushopsId,
//     this.divisionsId,
//     this.districtsId,
//     this.locationsId,
//     this.isDeleted,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.productimages,});
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     productImage = json['product_image'];
//     productName = json['product_name'];
//     productCode = json['product_code'];
//     purchasePrice = json['purchase_price'];
//     price = json['price'];
//     offerPrice = json['offer_price'];
//     salesPrice = json['sales_price'];
//     productStatus = json['product_status'];
//     discount = json['discount'];
//     warranty = json['warranty'];
//     guarantee = json['guarantee'];
//     brand = json['brand'];
//     tags = json['tags'];
//     countSale = json['count_sale'];
//     status = json['status'];
//     stock = json['stock'];
//     category = json['category'];
//     categoriesId = json['categories_id'];
//     subcategoriesId = json['subcategories_id'];
//     galleriesId = json['galleries_id'];
//     description = json['description'];
//     priority = json['priority'];
//     moushopsId = json['moushops_id'];
//     divisionsId = json['divisions_id'];
//     districtsId = json['districts_id'];
//     locationsId = json['locations_id'];
//     isDeleted = json['is_deleted'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     if (json['productimages'] != null) {
//       productimages = [];
//       json['productimages'].forEach((v) {
//         productimages.add(Productimages.fromJson(v));
//       });
//     }
//   }
//   int id;
//   dynamic productImage;
//   String productName;
//   String productCode;
//   String purchasePrice;
//   String price;
//   String offerPrice;
//   String salesPrice;
//   String productStatus;
//   String discount;
//   String warranty;
//   String guarantee;
//   String brand;
//   dynamic tags;
//   String countSale;
//   String status;
//   dynamic stock;
//   dynamic category;
//   String categoriesId;
//   String subcategoriesId;
//   dynamic galleriesId;
//   String description;
//   dynamic priority;
//   dynamic moushopsId;
//   dynamic divisionsId;
//   dynamic districtsId;
//   dynamic locationsId;
//   dynamic isDeleted;
//   String createdAt;
//   String updatedAt;
//   dynamic deletedAt;
//   List<Productimages> productimages;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['product_image'] = productImage;
//     map['product_name'] = productName;
//     map['product_code'] = productCode;
//     map['purchase_price'] = purchasePrice;
//     map['price'] = price;
//     map['offer_price'] = offerPrice;
//     map['sales_price'] = salesPrice;
//     map['product_status'] = productStatus;
//     map['discount'] = discount;
//     map['warranty'] = warranty;
//     map['guarantee'] = guarantee;
//     map['brand'] = brand;
//     map['tags'] = tags;
//     map['count_sale'] = countSale;
//     map['status'] = status;
//     map['stock'] = stock;
//     map['category'] = category;
//     map['categories_id'] = categoriesId;
//     map['subcategories_id'] = subcategoriesId;
//     map['galleries_id'] = galleriesId;
//     map['description'] = description;
//     map['priority'] = priority;
//     map['moushops_id'] = moushopsId;
//     map['divisions_id'] = divisionsId;
//     map['districts_id'] = districtsId;
//     map['locations_id'] = locationsId;
//     map['is_deleted'] = isDeleted;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['deleted_at'] = deletedAt;
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
//   String productsId;
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
class Links {
  Links({
    this.url,
    this.label,
    this.active,});

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  dynamic url;
  String label;
  bool active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }

}