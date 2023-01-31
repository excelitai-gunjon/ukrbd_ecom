import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/model/response/profile/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/dio_client.dart';
import 'package:ecom_ukrbd/data/datasource/remote/exception/api_error_handler.dart';
import 'package:ecom_ukrbd/data/model/response/address_model.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/user_info_model.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileRepoUkrbd {
  final DioClientUkrbd dioClient;
  final SharedPreferences sharedPreferences;
  ProfileRepoUkrbd({@required this.dioClient, @required this.sharedPreferences});


  Future<ApiResponse> getUserProfile() async {
    try {
      final response = await dioClient.get(AppConstants.PROFILE_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<int> updateProfile(User userInfoModel, File file, String token,BuildContext context) async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://ukrbd.com/api/update/profile'));
    request.fields.addAll({
      'mobile': userInfoModel.customerMobile.toString(),
      'name': userInfoModel.customerName.toString(),
      'customer_address': userInfoModel.customerAddress.toString()
    });
    // request.files.add(await http.MultipartFile.fromPath('image', '/path/to/file'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      // _load(context, true);
      //print(await response.stream.bytesToString());
      final data= await response.stream.bytesToString();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(jsonDecode(data)["message"]),
        backgroundColor: Colors.teal,
      ));
      return response.statusCode;
    }
    else {
      final data= await response.stream.bytesToString();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(data),
        backgroundColor: Colors.teal,
      ));
      //print(response.reasonPhrase);
      return response.statusCode;
    }

  }


  Future<ApiResponse> updateProfileWithImage(FormData formData) async {
    // userModel..image=await MultipartFile.fromFile(file.path, filename:file.path.split('/').last);
    try {
      final response = await dioClient.post(AppConstants.PROFILE_UPDATE_URI,data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Future<http.StreamedResponse> updateProfile(User userInfoModel, File file, String token) async {
  //   http.MultipartRequest request = http.('POST', Uri.parse('${AppConstants.UKRBD_BASE_URL}${AppConstants.PROFILE_UPDATE_URI}'));
  //   request.headers.addAll(<String,String>{'Accept': 'application/json','Authorization': 'Bearer $token'});
  //   if(file != null){
  //     request.files.add(http.MultipartFile('image', file.readAsBytes().asStream(), file.lengthSync(), filename: file.path.split('/').last));
  //   }
  //   Map<String, String> _fields = Map();
  //   _fields.addAll(<String, String>{
  //     // '_method': 'put',
  //     'customer_name': userInfoModel.customerName,
  //     'customer_mobile': userInfoModel.customerMobile,
  //     'customer_address': userInfoModel.customerAddress,
  //   });
  //   request.fields.addAll(_fields);
  //   print('========>${_fields.toString()}');
  //   http.StreamedResponse response = await request.send();
  //   return response;
  // }

}
