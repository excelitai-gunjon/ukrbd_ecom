

class ProfileModel {
  ProfileModel({
      this.success, 
      this.user, 
      this.message,});

  ProfileModel.fromJson(dynamic json) {
    success = json['success'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
  }
  int success;
  User user;
  String message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (user != null) {
      map['user'] = user.toJson();
    }
    map['message'] = message;
    return map;
  }

}

class User {
  User({
    this.id,
    this.userId,
    this.customerName,
    this.email,
    this.customerMobile,
    this.customerAddress,
    this.due,
    this.bonus,
    this.fatherName,
    this.motherName,
    this.nid,
    this.gender,
    this.permanentAddress,
    this.image,
    this.userRole,
    this.referenceId,
    this.createdAt,
    this.updatedAt,
    this.amount,});

  User.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    customerName = json['customer_name'];
    email = json['email'];
    customerMobile = json['customer_mobile'];
    customerAddress = json['customer_address'];
    due = json['due'];
    bonus = json['bonus'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    nid = json['nid'];
    gender = json['gender'];
    permanentAddress = json['permanent_address'];
    image = json['image'];
    userRole = json['user_role'];
    referenceId = json['reference_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    amount = json['amount'];
  }
  int id;
  int userId;
  String customerName;
  dynamic email;
  String customerMobile;
  String customerAddress;
  String due;
  int bonus;
  dynamic fatherName;
  dynamic motherName;
  dynamic nid;
  dynamic gender;
  dynamic permanentAddress;
  String image;
  String userRole;
  dynamic referenceId;
  String createdAt;
  String updatedAt;
  int amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['customer_name'] = customerName;
    map['email'] = email;
    map['customer_mobile'] = customerMobile;
    map['customer_address'] = customerAddress;
    map['due'] = due;
    map['bonus'] = bonus;
    map['father_name'] = fatherName;
    map['mother_name'] = motherName;
    map['nid'] = nid;
    map['gender'] = gender;
    map['permanent_address'] = permanentAddress;
    map['image'] = image;
    map['user_role'] = userRole;
    map['reference_id'] = referenceId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['amount'] = amount;
    return map;
  }

}