
import 'package:ecom_ukrbd/data/model/body/order_place_model.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/base/error_response.dart';
import 'package:ecom_ukrbd/data/repository/order_place_repo.dart';
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/dashboard/dashboard_screen_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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


      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 1),
        content: Text(apiResponse.response.data.toString()),
      ));


      // Duration(seconds: 2 );
      _isLoading = false;
      notifyListeners();
      Provider.of<CartProviderUkrbd>(context,listen: false).deleteCart();
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardScreenUkrbd()));
      Provider.of<BottomNavigationBarProvider>(context, listen: false).onItemTapped(0, false, context);
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