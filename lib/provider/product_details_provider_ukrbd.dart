

import 'package:ecom_ukrbd/data/model/response/ukrbd/product_details.dart';
import 'package:ecom_ukrbd/data/repository/product_details_repo_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';



class ProductDetailsProviderUkrbd with ChangeNotifier{

  final ProductDetailsRepoUkrbd productDetailsRepoUkrbd;

  ProductDetailsProviderUkrbd({@required this.productDetailsRepoUkrbd});

  bool _isLoading=false;
  ProductDetails _productDetails;

  bool get isLoading => _isLoading;
  ProductDetails get productDetails => _productDetails;

  Future<void> getProductDetails(bool reload, BuildContext context,String productId) async {

    _isLoading=true;
    _productDetails=null;

    notifyListeners();
    if (_productDetails==null || reload) {
      ApiResponse apiResponse = await productDetailsRepoUkrbd.getProductDetails(productId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200){
        _isLoading=false;
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        _productDetails = ProductDetails.fromJson(apiResponse.response.data);

        notifyListeners();
      } else {
        _isLoading=false;
        notifyListeners();
        // ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }

  }


}