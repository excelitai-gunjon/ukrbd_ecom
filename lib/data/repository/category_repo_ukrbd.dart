import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/datasource/remote/exception/api_error_handler.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';

class CategoryRepoUkrbd {
  final DioClientUkrbd dioClient;
  CategoryRepoUkrbd({@required this.dioClient});

  Future<ApiResponse> getCategoryList() async {
    try {
      final response = await dioClient.get(
          AppConstants.CATEGORIES_URI_UKRBD);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}