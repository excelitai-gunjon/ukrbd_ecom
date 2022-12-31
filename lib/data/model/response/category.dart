class Category {
  dynamic _id;
  dynamic  _name;
  dynamic  _slug;
  dynamic  _icon;
  dynamic _parentId;
  dynamic _position;
  dynamic  _createdAt;
  dynamic  _updatedAt;
  List<SubCategory> _subCategories;

  Category(
      {dynamic id,
        dynamic  name,
        dynamic  slug,
        dynamic  icon,
        dynamic parentId,
        dynamic position,
        dynamic  createdAt,
        dynamic  updatedAt,
        List<SubCategory> subCategories}) {
    this._id = id;
    this._name = name;
    this._slug = slug;
    this._icon = icon;
    this._parentId = parentId;
    this._position = position;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._subCategories = subCategories;
  }

  dynamic get id => _id;
  dynamic  get name => _name;
  dynamic  get slug => _slug;
  dynamic  get icon => _icon;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  dynamic  get createdAt => _createdAt;
  dynamic  get updatedAt => _updatedAt;
  List<SubCategory> get subCategories => _subCategories;

  Category.fromJson(Map<String, dynamic > json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['childes'] != null) {
      _subCategories = [];
      json['childes'].forEach((v) {
        _subCategories.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic > toJson() {
    final Map<String, dynamic > data = new Map<String, dynamic >();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['icon'] = this._icon;
    data['parent_id'] = this._parentId;
    data['position'] = this._position;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._subCategories != null) {
      data['childes'] = this._subCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  dynamic _id;
  dynamic  _name;
  dynamic  _slug;
  dynamic  _icon;
  dynamic _parentId;
  dynamic _position;
  dynamic  _createdAt;
  dynamic  _updatedAt;
  List<SubSubCategory> _subSubCategories;

  SubCategory(
      {dynamic id,
        dynamic  name,
        dynamic  slug,
        dynamic  icon,
        dynamic parentId,
        dynamic position,
        dynamic  createdAt,
        dynamic  updatedAt,
        List<SubSubCategory> subSubCategories}) {
    this._id = id;
    this._name = name;
    this._slug = slug;
    this._icon = icon;
    this._parentId = parentId;
    this._position = position;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._subSubCategories = subSubCategories;
  }

  dynamic get id => _id;
  dynamic  get name => _name;
  dynamic  get slug => _slug;
  dynamic  get icon => _icon;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  dynamic  get createdAt => _createdAt;
  dynamic  get updatedAt => _updatedAt;
  List<SubSubCategory> get subSubCategories => _subSubCategories;

  SubCategory.fromJson(Map<String, dynamic > json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['childes'] != null) {
      _subSubCategories = [];
      json['childes'].forEach((v) {
        _subSubCategories.add(new SubSubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic > toJson() {
    final Map<String, dynamic > data = new Map<String, dynamic >();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['icon'] = this._icon;
    data['parent_id'] = this._parentId;
    data['position'] = this._position;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._subSubCategories != null) {
      data['childes'] = this._subSubCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubSubCategory {
  dynamic _id;
  dynamic  _name;
  dynamic  _slug;
  dynamic  _icon;
  dynamic _parentId;
  dynamic _position;
  dynamic  _createdAt;
  dynamic  _updatedAt;

  SubSubCategory(
      {dynamic id,
        dynamic  name,
        dynamic  slug,
        dynamic  icon,
        dynamic parentId,
        dynamic position,
        dynamic  createdAt,
        dynamic  updatedAt}) {
    this._id = id;
    this._name = name;
    this._slug = slug;
    this._icon = icon;
    this._parentId = parentId;
    this._position = position;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  dynamic get id => _id;
  dynamic  get name => _name;
  dynamic  get slug => _slug;
  dynamic  get icon => _icon;
  dynamic get parentId => _parentId;
  dynamic get position => _position;
  dynamic  get createdAt => _createdAt;
  dynamic  get updatedAt => _updatedAt;

  SubSubCategory.fromJson(Map<String, dynamic > json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic > toJson() {
    final Map<String, dynamic > data = new Map<String, dynamic >();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['icon'] = this._icon;
    data['parent_id'] = this._parentId;
    data['position'] = this._position;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
