import 'dart:convert';
import 'dart:io';

import 'package:ecom_ukrbd/data/model/response/profile/profile_model.dart';
import 'package:ecom_ukrbd/data/repository/profile_repo_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/address_model.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/base/error_response.dart';
import 'package:ecom_ukrbd/data/model/response/response_model.dart';
import 'package:ecom_ukrbd/data/model/response/user_info_model.dart';
import 'package:ecom_ukrbd/data/repository/profile_repo.dart';
import 'package:ecom_ukrbd/helper/api_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'order_provider.dart';

class ProfileProviderUkrbd extends ChangeNotifier {
  final ProfileRepoUkrbd profileRepo;
  ProfileProviderUkrbd({@required this.profileRepo});

  bool _isLoading = false;
  ProfileModel _profileModel;
  User _user;


  bool get isLoading => _isLoading;
  ProfileModel get profileModel => _profileModel;
  User get user => _user;


  Future<void> getUserProfile(BuildContext context) async {

    _isLoading=true;

    ApiResponse apiResponse = await profileRepo.getUserProfile();
    if (apiResponse.response != null && apiResponse.response.statusCode == 201) {
      _isLoading=false;
      _profileModel = ProfileModel.fromJson(apiResponse.response.data);
      _user=_profileModel.user;
      notifyListeners();
    } else {
      _isLoading = false;
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      // callback(false, '', '' , errorMessage);
      notifyListeners();
      // ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }


  Future<int> updateUserProfile(User updateUserModel, File file, String token,BuildContext context) async {
    _isLoading = true;
    //ApiResponse apiResponse;

    ResponseModel responseModel;
    final statusCode = await profileRepo.updateProfile(updateUserModel, file, token,context);
    _isLoading = false;
    if (statusCode == 201) {
      _isLoading = false;
      // Map map = jsonDecode(await response.stream.bytesToString());
      // ProfileModel profileModel=ProfileModel.fromJson(apiResponse.response.data);
      // String message = map["message"];
      //
      // responseModel = ResponseModel(message, true);
      // print(message);

      notifyListeners();
      return statusCode;
    } else {
      _isLoading = false;
      // String errorMessage;
      // if (apiResponse.error is String) {
      //   print(apiResponse.error.toString());
      //   errorMessage = apiResponse.error.toString();
      // } else {
      //   ErrorResponse errorResponse = apiResponse.error;
      //   print(errorResponse.errors[0].message);
      //   errorMessage = errorResponse.errors[0].message;
      // }
      // // callback(false, '', '' , errorMessage);
      notifyListeners();
      return statusCode;
    }
    // notifyListeners();
    // return responseModel;
  }

}
