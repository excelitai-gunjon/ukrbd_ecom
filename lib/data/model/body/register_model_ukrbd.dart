class RegisterModelUkrbd {
  String name;
  String mobile;
  String email;
  String password;
  String confirmPassword;

  RegisterModelUkrbd(
      {this.name,
        this.mobile,
        this.email,
        this.password,
        this.confirmPassword});

  RegisterModelUkrbd.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}