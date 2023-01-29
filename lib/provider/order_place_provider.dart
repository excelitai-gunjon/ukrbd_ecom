
import 'package:ecom_ukrbd/data/model/body/order_place_model.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/base/error_response.dart';
import 'package:ecom_ukrbd/data/repository/order_place_repo.dart';
import 'package:flutter/material.dart';

class OrderPlaceProvider with ChangeNotifier {
  final OrderPlaceRepo orderPlaceRepo;

  OrderPlaceProvider({@required this.orderPlaceRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;



  Future<int> orderPlace(OrderPlaceModel orderPlaceModel,BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await orderPlaceRepo.orderPlace(orderPlaceModel);
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiResponse.response.data.toString()),
        backgroundColor: Colors.teal,
      ));
      notifyListeners();
      return apiResponse.response.statusCode;
    } else {
      _isLoading=false;
      notifyListeners();
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
      // callback(false, '', '' , errorMessage);
      notifyListeners();
      return apiResponse.response.statusCode;
    }
  }
}