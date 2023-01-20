


import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/datasource/remote/exception/api_error_handler.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';

class ProductDetailsRepoUkrbd {
  final DioClientUkrbd dioClient;
  ProductDetailsRepoUkrbd({@required this.dioClient});

  Future<ApiResponse> getProductDetails(String id) async {

    print(id);
    try {
      final response = await dioClient.get(AppConstants.PRODUCT_DETAILS_UKRBD+id);
      print(">>>>>>>>>>> kkr  api response" );
      print(response.data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}