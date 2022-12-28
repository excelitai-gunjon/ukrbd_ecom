

import 'package:ecom_ukrbd/data/model/body/register_model_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/body/login_model.dart';
import 'package:ecom_ukrbd/data/model/body/register_model.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/base/error_response.dart';
import 'package:ecom_ukrbd/data/model/response/response_model.dart';
import '../data/repository/auth_repo_ukrbd.dart';
import 'package:ecom_ukrbd/helper/api_checker.dart';

class AuthProviderUkrbd with ChangeNotifier {
  final AuthRepoUkrbd authRepoUkrbd;
  AuthProviderUkrbd({@required this.authRepoUkrbd});

  bool _isLoading = false;
  bool _isRemember = false;
  int _selectedIndex = 0;
  int get selectedIndex =>_selectedIndex;

  updateSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }


  bool get isLoading => _isLoading;
  bool get isRemember => _isRemember;

  void updateRemember(bool value) {
    _isRemember = value;
    notifyListeners();
  }


  Future registration(RegisterModelUkrbd register, Function callback,BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.registration(register);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response.statusCode == 201) {
      //Map map = apiResponse.response.data;
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());
      print(apiResponse.response.data.toString());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiResponse.response.data.toString()),
        backgroundColor: Colors.teal,
      ));

      String temporaryToken = '';
      String token = '';
      String message = '';
      // try{
      //   message = map["message"];
      //
      // }catch(e){
      //
      // }
      // try{
      //   token = map["token"];
      //
      // }catch(e){
      //
      // }
      // try{
      //   temporaryToken = map["temporary_token"];
      //
      // }catch(e){
      //
      // }
      // if(token != null && token.isNotEmpty){
      //   authRepoUkrbd.saveUserToken(token);
      //   await authRepoUkrbd.updateToken();
      // }
      // callback(true, token, temporaryToken, message);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiResponse.error.data.toString()),
        backgroundColor: Colors.red,
      ));

      // String errorMessage;
      // if (apiResponse.error is String) {
      //   print(apiResponse.error.toString());
      //   errorMessage = apiResponse.error.toString();
      // } else {
      //   ErrorResponse errorResponse = apiResponse.error;
      //   print(errorResponse.errors[0].message);
      //   errorMessage = errorResponse.errors[0].message;
      // }
      // callback(false, '', '', errorMessage);
      notifyListeners();
    }
  }

  Future authToken(String authToken ) async{
    authRepoUkrbd.saveAuthToken(authToken);
    notifyListeners();
  }

  Future login(LoginModel loginBody, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.login(loginBody);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      Map map = apiResponse.response.data;
      String temporaryToken = '';
      String token = '';
      String message = '';
      // String token = map["token"];

      try{
        message = map["message"];

      }catch(e){

      }
      try{
        token = map["token"];

      }catch(e){

      }
      try{
        temporaryToken = map["temporary_token"];

      }catch(e){

      }

      if(token != null && token.isNotEmpty){
        authRepoUkrbd.saveUserToken(token);
        await authRepoUkrbd.updateToken();
      }

      callback(true, token, temporaryToken, message);
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      callback(false, '', '' , errorMessage);
      notifyListeners();
    }
  }

  Future<void> updateToken(BuildContext context) async {
    ApiResponse apiResponse = await authRepoUkrbd.updateToken();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {

    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  //email
  Future<ResponseModel> checkEmail(String email, String temporaryToken) async {
    _isPhoneNumberVerificationButtonLoading = true;
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.checkEmail(email,temporaryToken);
    _isPhoneNumberVerificationButtonLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel(apiResponse.response.data['token'], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage,false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> verifyEmail(String email, String token) async {
    _isPhoneNumberVerificationButtonLoading = true;
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.verifyEmail(email, _verificationCode, token);
    _isPhoneNumberVerificationButtonLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      authRepoUkrbd.saveUserToken(apiResponse.response.data['token']);
      await authRepoUkrbd.updateToken();
      responseModel = ResponseModel('Successful', true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage, false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }

  //phone

  Future<ResponseModel> checkPhone(String phone, String temporaryToken) async {
    _isPhoneNumberVerificationButtonLoading = true;
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.checkPhone(phone, temporaryToken);
    _isPhoneNumberVerificationButtonLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel(apiResponse.response.data["token"],true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel( errorMessage,false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> verifyPhone(String phone, String token) async {
    _isPhoneNumberVerificationButtonLoading = true;
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.verifyPhone(phone, token, _verificationCode);
    _isPhoneNumberVerificationButtonLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel( apiResponse.response.data["message"], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage,false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }


  Future<ResponseModel> verifyOtp(String phone) async {
    _isPhoneNumberVerificationButtonLoading = true;
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.verifyOtp(phone, _verificationCode);
    _isPhoneNumberVerificationButtonLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel( apiResponse.response.data["message"], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage,false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }


  Future<ResponseModel> resetPassword(String identity, String otp, String password, String confirmPassword) async {
    _isPhoneNumberVerificationButtonLoading = true;
    _verificationMsg = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.resetPassword(identity,otp,password,confirmPassword);
    _isPhoneNumberVerificationButtonLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel( apiResponse.response.data["message"], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage,false);
      _verificationMsg = errorMessage;
    }
    notifyListeners();
    return responseModel;
  }



  // for phone verification
  bool _isPhoneNumberVerificationButtonLoading = false;

  bool get isPhoneNumberVerificationButtonLoading => _isPhoneNumberVerificationButtonLoading;
  String _verificationMsg = '';

  String get verificationMessage => _verificationMsg;
  String _email = '';
  String _phone = '';

  String get email => _email;
  String get phone => _phone;

  updateEmail(String email) {
    _email = email;
    notifyListeners();
  }
  updatePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void clearVerificationMessage() {
    _verificationMsg = '';
  }


  // for verification Code
  String _verificationCode = '';

  String get verificationCode => _verificationCode;
  bool _isEnableVerificationCode = false;

  bool get isEnableVerificationCode => _isEnableVerificationCode;

  updateVerificationCode(String query) {
    if (query.length == 4) {
      _isEnableVerificationCode = true;
    } else {
      _isEnableVerificationCode = false;
    }
    _verificationCode = query;
    notifyListeners();
  }





  // for user Section
  String getUserToken() {
    return authRepoUkrbd.getUserToken();
  }

  //get auth token
  // for user Section
  String getAuthToken() {
    return authRepoUkrbd.getAuthToken();
  }


  bool isLoggedIn() {
    return authRepoUkrbd.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepoUkrbd.clearSharedData();
  }

  // for  Remember Email
  void saveUserEmail(String email, String password) {
    authRepoUkrbd.saveUserEmailAndPassword(email, password);
  }

  String getUserEmail() {
    return authRepoUkrbd.getUserEmail() ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepoUkrbd.clearUserEmailAndPassword();
  }


  String getUserPassword() {
    return authRepoUkrbd.getUserPassword() ?? "";
  }

  Future<ResponseModel> forgetPassword(String email) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepoUkrbd.forgetPassword(email);
    _isLoading = false;
    notifyListeners();
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      responseModel = ResponseModel(apiResponse.response.data["message"], true);
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      responseModel = ResponseModel(errorMessage, false);
    }
    return responseModel;
  }
}
