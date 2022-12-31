import 'Subcategories.dart';

class Categories {
  Categories({
      this.id, 
      this.category, 
      this.image, 
      this.priority, 
      this.status, 
      this.isDeleted, 
      this.createdAt, 
      this.updatedAt, 
      this.subcategories,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    image = json['image'];
    priority = json['priority'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subcategories'] != null) {
      subcategories = [];
      json['subcategories'].forEach((v) {
        subcategories.add(Subcategories.fromJson(v));
      });
    }
  }
  dynamic  id;
  dynamic  category;
  dynamic  image;
  dynamic  priority;
  dynamic  status;
  dynamic isDeleted;
  dynamic  createdAt;
  dynamic  updatedAt;
  List<Subcategories> subcategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['image'] = image;
    map['priority'] = priority;
    map['status'] = status;
    map['is_deleted'] = isDeleted;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (subcategories != null) {
      map['subcategories'] = subcategories.map((v) => v.toJson()).toList();
    }
    return map;
  }

}