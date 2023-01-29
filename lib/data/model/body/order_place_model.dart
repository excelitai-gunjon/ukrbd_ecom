


class OrderPlaceModel {
  OrderPlaceModel({
    this.name,
    this.address,
    this.mobile,
    this.carts,
    this.cartsQuantity,
    this.email,
    this.referenceId,});

  OrderPlaceModel.fromJson(dynamic json) {
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
    carts = json['carts'];
    cartsQuantity = json['carts_quantity'];
    email = json['email'];
    referenceId = json['referenceId'];
  }
  String name;
  String address;
  String mobile;
  String carts;
  String cartsQuantity;
  String email;
  String referenceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['address'] = address;
    map['mobile'] = mobile;
    map['carts'] = carts;
    map['carts_quantity'] = cartsQuantity;
    map['email'] = email;
    map['referenceId'] = referenceId;
    return map;
  }

}