import 'dart:convert';
/// sliders : [{"id":1,"image":"1633419538.jpg","slider_title":"c","slider_description":null,"link":"#","priority":"3","status":"show","created_at":"2020-08-29T03:25:07.000000Z","updated_at":"2021-10-05T01:38:59.000000Z"},{"id":2,"image":"1633419555.jpg","slider_title":".","slider_description":null,"link":"#","priority":"3","status":"show","created_at":"2020-08-29T03:25:26.000000Z","updated_at":"2021-10-05T01:39:15.000000Z"},{"id":3,"image":"1633419570.jpg","slider_title":null,"slider_description":null,"link":"#","priority":"3","status":"show","created_at":"2020-09-18T07:34:50.000000Z","updated_at":"2021-10-05T01:39:31.000000Z"},{"id":4,"image":"1633419589.jpg","slider_title":null,"slider_description":null,"link":null,"priority":"3","status":"show","created_at":"2020-09-18T07:38:36.000000Z","updated_at":"2021-10-05T01:39:49.000000Z"},{"id":5,"image":"1633419602.jpg","slider_title":null,"slider_description":null,"link":null,"priority":"3","status":"show","created_at":"2020-09-18T07:38:50.000000Z","updated_at":"2021-10-05T01:40:02.000000Z"},{"id":6,"image":"1633419616.jpg","slider_title":"c","slider_description":null,"link":null,"priority":"3","status":"show","created_at":"2020-09-18T07:39:03.000000Z","updated_at":"2021-10-05T01:40:16.000000Z"},{"id":7,"image":"1633419629.jpg","slider_title":null,"slider_description":null,"link":null,"priority":"3","status":"show","created_at":"2020-09-18T07:39:15.000000Z","updated_at":"2021-10-05T01:40:29.000000Z"},{"id":8,"image":"1633419641.jpg","slider_title":null,"slider_description":null,"link":null,"priority":"3","status":"show","created_at":"2020-09-18T07:42:49.000000Z","updated_at":"2021-10-05T01:40:41.000000Z"}]

BannerModelUkrbd bannerModelUkrbdFromJson(String str) => BannerModelUkrbd.fromJson(json.decode(str));
String bannerModelUkrbdToJson(BannerModelUkrbd data) => json.encode(data.toJson());
class BannerModelUkrbd {
  BannerModelUkrbd({
      List<Sliders> sliders,}){
    _sliders = sliders;
}

  BannerModelUkrbd.fromJson(dynamic json) {
    if (json['sliders'] != null) {
      _sliders = [];
      json['sliders'].forEach((v) {
        _sliders.add(Sliders.fromJson(v));
      });
    }
  }
  List<Sliders> _sliders;
BannerModelUkrbd copyWith({  List<Sliders> sliders,
}) => BannerModelUkrbd(  sliders: sliders ?? _sliders,
);
  List<Sliders> get sliders => _sliders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sliders != null) {
      map['sliders'] = _sliders.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// image : "1633419538.jpg"
/// slider_title : "c"
/// slider_description : null
/// link : "#"
/// priority : "3"
/// status : "show"
/// created_at : "2020-08-29T03:25:07.000000Z"
/// updated_at : "2021-10-05T01:38:59.000000Z"

Sliders slidersFromJson(String str) => Sliders.fromJson(json.decode(str));
String slidersToJson(Sliders data) => json.encode(data.toJson());
class Sliders {
  Sliders({
      num id, 
      String image, 
      String sliderTitle, 
      dynamic sliderDescription, 
      String link, 
      String priority, 
      String status, 
      String createdAt, 
      String updatedAt,}){
    _id = id;
    _image = image;
    _sliderTitle = sliderTitle;
    _sliderDescription = sliderDescription;
    _link = link;
    _priority = priority;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Sliders.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _sliderTitle = json['slider_title'];
    _sliderDescription = json['slider_description'];
    _link = json['link'];
    _priority = json['priority'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num _id;
  String _image;
  String _sliderTitle;
  dynamic _sliderDescription;
  String _link;
  String _priority;
  String _status;
  String _createdAt;
  String _updatedAt;
Sliders copyWith({  num id,
  String image,
  String sliderTitle,
  dynamic sliderDescription,
  String link,
  String priority,
  String status,
  String createdAt,
  String updatedAt,
}) => Sliders(  id: id ?? _id,
  image: image ?? _image,
  sliderTitle: sliderTitle ?? _sliderTitle,
  sliderDescription: sliderDescription ?? _sliderDescription,
  link: link ?? _link,
  priority: priority ?? _priority,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id;
  String get image => _image;
  String get sliderTitle => _sliderTitle;
  dynamic get sliderDescription => _sliderDescription;
  String get link => _link;
  String get priority => _priority;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['slider_title'] = _sliderTitle;
    map['slider_description'] = _sliderDescription;
    map['link'] = _link;
    map['priority'] = _priority;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}