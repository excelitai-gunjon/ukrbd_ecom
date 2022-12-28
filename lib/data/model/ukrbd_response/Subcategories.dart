class Subcategories {
  Subcategories({
      this.id, 
      this.categoriesId, 
      this.subCategory, 
      this.userId, 
      this.status, 
      this.priority, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Subcategories.fromJson(dynamic json) {
    id = json['id'];
    categoriesId = json['categories_id'];
    subCategory = json['sub_category'];
    userId = json['user_id'];
    status = json['status'];
    priority = json['priority'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int id;
  String categoriesId;
  String subCategory;
  String userId;
  dynamic status;
  dynamic priority;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['categories_id'] = categoriesId;
    map['sub_category'] = subCategory;
    map['user_id'] = userId;
    map['status'] = status;
    map['priority'] = priority;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}