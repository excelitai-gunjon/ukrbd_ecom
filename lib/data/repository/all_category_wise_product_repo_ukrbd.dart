
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/datasource/remote/exception/api_error_handler.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';

class AllCategoryWiseProductRepoUkrbd {
  final DioClientUkrbd dioClient;
  AllCategoryWiseProductRepoUkrbd({@required this.dioClient});

  Future<ApiResponse> getAllCategoryWiseProductList() async {

    try {
      final response = await dioClient.get(
          AppConstants.ALL_CATEGORY_WISE_PRODUCT_UKRBD);


      print(">>>>>>>>>>> kkr  api response" );
      print(response.data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}