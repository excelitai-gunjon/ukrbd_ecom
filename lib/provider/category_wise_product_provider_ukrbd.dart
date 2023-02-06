

import 'package:ecom_ukrbd/data/model/response/ukrbd/category_wise_product_model/category_wise_product.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

import 'package:ecom_ukrbd/data/repository/category_wise_product_repo.dart';
import 'package:ecom_ukrbd/helper/api_checker_ukrbd.dart';


class CategoryWiseProductProviderUkrbd with ChangeNotifier{

  final CategoryWiseProductRepoUkrbd categoryWiseProductRepoUkrbd;

  CategoryWiseProductProviderUkrbd({@required this.categoryWiseProductRepoUkrbd});


  //List<Categories> _categoryList = [];
  bool _isLoading=false;
  int _categorySelectedIndex;
  List<Products> _categoryWiseProductList=[];
  CategoryWiseProduct _categoryWiseProduct;

  bool get isloading=>_isLoading;

  CategoryWiseProduct get categoryWiseProductResponse=>_categoryWiseProduct;

  List<Products> get categoryWiseProductList => _categoryWiseProductList;
  int get categorySelectedIndex => _categorySelectedIndex;






  Future<void> getCategoryWiseProductListForHomePage(bool reload, BuildContext context,String categoryId) async {

    _isLoading=true;
    notifyListeners();


    List<Products> catProductList;
      ApiResponse apiResponse = await categoryWiseProductRepoUkrbd.getCategoryWiseProductList(categoryId);

      print(apiResponse.response);
      // print(apiResponse.response);

      if (apiResponse.response!= null && apiResponse.response.statusCode == 200) {
        _isLoading=false;
        notifyListeners();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        CategoryWiseProduct categoryWiseProduct = CategoryWiseProduct.fromJson(apiResponse.response.data);

        catProductList=categoryWiseProduct.products;


      } else {
        _isLoading=false;
        notifyListeners();

      }

      notifyListeners();
      // return catProductList;
  }

  Future<void> getCategoryWiseProductList(bool reload, BuildContext context,String categoryId) async {

    _isLoading=true;
    notifyListeners();

    if (_categoryWiseProductList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryWiseProductRepoUkrbd.getCategoryWiseProductList(categoryId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _isLoading=false;
        notifyListeners();
        _categoryWiseProductList.clear();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        _categoryWiseProduct = CategoryWiseProduct.fromJson(apiResponse.response.data);
        _categoryWiseProductList=_categoryWiseProduct.products;
        _categorySelectedIndex = 0;
      } else {
        _isLoading=false;
        notifyListeners();
        // ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }
    _isLoading=false;
    notifyListeners();

  }

  void clear(){
    _categoryWiseProductList.clear();
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   _categoryWiseProductList.clear();
  //   notifyListeners();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }

}