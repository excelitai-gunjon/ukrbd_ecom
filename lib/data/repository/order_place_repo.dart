
import 'package:dio/dio.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/model/body/order_place_model.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/datasource/remote/exception/api_error_handler.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPlaceRepo {
  final DioClientUkrbd dioClient;
  final SharedPreferences sharedPreferences;

  OrderPlaceRepo({@required this.dioClient, @required this.sharedPreferences});


  Future<ApiResponse> orderPlace(OrderPlaceModel orderPlaceModel) async {
    try {
      Response response = await dioClient.post(
        AppConstants.ORDER_PLACE_URI_URI,
        data: orderPlaceModel.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}