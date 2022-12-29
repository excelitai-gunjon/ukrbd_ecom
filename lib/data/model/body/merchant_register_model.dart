class MerchantRegisterModel {
  String name;
  String mobile;
  String email;
  String password;
  String userId;
  String confirmPassword;
  String presentAddress;
  String referenceId;

  MerchantRegisterModel(
      {this.name,
        this.mobile,
        this.email,
        this.password,
        this.userId,
        this.confirmPassword,
        this.presentAddress,
        this.referenceId});

  MerchantRegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    userId = json['user_id'];
    confirmPassword = json['confirm_password'];
    presentAddress = json['present_address'];
    referenceId = json['reference_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['user_id'] = this.userId;
    data['confirm_password'] = this.confirmPassword;
    data['present_address'] = this.presentAddress;
    data['reference_id'] = this.referenceId;
    return data;
  }
}
