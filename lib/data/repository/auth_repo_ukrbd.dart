
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/datasource/remote/exception/api_error_handler.dart';
import 'package:ecom_ukrbd/data/model/body/login_model.dart';
import 'package:ecom_ukrbd/data/model/body/merchant_register_model.dart';
import 'package:ecom_ukrbd/data/model/body/register_model_ukrbd.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoUkrbd {
  final DioClientUkrbd dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepoUkrbd({@required this.dioClient, @required this.sharedPreferences});



  Future<ApiResponse> registration(RegisterModelUkrbd register) async {
    try {
      Response response = await dioClient.post(
        AppConstants.REGISTER_UKRBD,
        data: register.toJson(),
        // queryParameters: register.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> merchantRegistration(MerchantRegisterModel register) async {
    try {
      Response response = await dioClient.post(
        AppConstants.MERCHANT_REGISTER_UKRBD,
        data: register.toJson(),
        // queryParameters: register.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> login(LoginModel loginBody) async {
    try {
      Response response = await dioClient.post(
        AppConstants.LOGIN_URI,
        data: loginBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> logout() async {

    try {
      Response response = await dioClient.post(
        AppConstants.LOGOUT_URI,

      );
      await removeUserToken();
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveUserToken(String token) async {
    dioClient.updateHeader(token, null);

    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  Future<void> removeUserToken()async{
    dioClient.updateHeader("", null);
    try {
      await sharedPreferences.clear();
    } catch (e) {
      throw e;
    }
  }

  String getUserToken(){
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  //auth token
  // for  user token
  Future<void> saveAuthToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getAuthToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }


  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  // Future<bool> clearSharedData() async {
  //   //sharedPreferences.remove(AppConstants.CART_LIST);
  //   sharedPreferences.remove(AppConstants.CURRENCY);
  //   sharedPreferences.remove(AppConstants.TOKEN);
  //   sharedPreferences.remove(AppConstants.USER);
  //   FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
  //   return true;
  // }

  // for verify Email
  Future<ApiResponse> checkEmail(String email, String temporaryToken) async {
    try {
      Response response = await dioClient.post(AppConstants.CHECK_EMAIL_URI, data: {"email": email, "temporary_token" : temporaryToken});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyEmail(String email, String token, String tempToken) async {
    try {
      Response response = await dioClient.post(AppConstants.VERIFY_EMAIL_URI, data: {"email": email, "token": token, 'temporary_token': tempToken});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  //verify phone number
  Future<ApiResponse> checkPhone(String phone, String temporaryToken) async {
    try {
      Response response = await dioClient.post(
          AppConstants.CHECK_PHONE_URI, data: {"phone": phone, "temporary_token" :temporaryToken});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyPhone(String phone, String token,String otp) async {
    try {
      Response response = await dioClient.post(
          AppConstants.VERIFY_PHONE_URI, data: {"phone": phone.trim(), "temporary_token": token,"otp": otp});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> verifyOtp(String identity, String otp) async {
    try {
      Response response = await dioClient.post(
          AppConstants.VERIFY_OTP_URI, data: {"identity": identity.trim(), "otp": otp});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> resetPassword(String identity, String otp ,String password, String confirmPassword) async {
    print('======Password====>$password');
    try {
      Response response = await dioClient.post(
          AppConstants.RESET_PASSWORD_URI, data: {"_method" : "put", "identity": identity.trim(), "otp": otp,"password": password, "confirm_password":confirmPassword});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  // for  Remember Email
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_EMAIL, email);
    } catch (e) {
      throw e;
    }
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_EMAIL);
  }

  Future<ApiResponse> forgetPassword(String identity) async {
    try {
      Response response = await dioClient.post(AppConstants.FORGET_PASSWORD_URI, data: {"identity": identity});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
