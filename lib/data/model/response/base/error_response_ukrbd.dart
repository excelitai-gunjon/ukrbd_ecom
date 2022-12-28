

class ErrorResponseUkrbd {
  ErrorResponseUkrbd({
    this.message,
    this.errors,});

  ErrorResponseUkrbd.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  String message;
  Errors errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors.toJson();
    }
    return map;
  }

}


class Errors {
  Errors({
    this.email,
    this.confirmPassword,});

  Errors.fromJson(dynamic json) {
    email = json['email'] != null ? json['email'].cast<String>() : [];
    confirmPassword = json['confirm_password'] != null ? json['confirm_password'].cast<String>() : [];
  }
  List<String> email;
  List<String> confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['confirm_password'] = confirmPassword;
    return map;
  }

}