

import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/category_wise_product_model/category_wise_product.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';

import 'package:ecom_ukrbd/data/repository/category_wise_product_repo.dart';
import 'package:ecom_ukrbd/helper/api_checker_ukrbd.dart';


class CategoryWiseProductProviderUkrbd with ChangeNotifier{

  final CategoryWiseProductRepoUkrbd categoryWiseProductRepoUkrbd;

  CategoryWiseProductProviderUkrbd({@required this.categoryWiseProductRepoUkrbd});


  //List<Categories> _categoryList = [];
  int _categorySelectedIndex;
  List<Data> _categoryWiseProductList=[];
  CategoryWiseProduct _categoryWiseProduct;

  CategoryWiseProduct get categoryWiseProductResponse=>_categoryWiseProduct;

  List<Data> get categoryWiseProductList => _categoryWiseProductList;
  int get categorySelectedIndex => _categorySelectedIndex;

  Future<List<Data>> getCategoryWiseProductListForHomePage(bool reload, BuildContext context,String categoryId) async {
    List<Data> catProductList;
      ApiResponse apiResponse = await categoryWiseProductRepoUkrbd.getCategoryWiseProductList(categoryId);

      if (apiResponse.response!= null && apiResponse.response.statusCode == 200)

      {
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        CategoryWiseProduct productModelList = CategoryWiseProduct.fromJson(apiResponse.response.data);
        catProductList=productModelList.products.data.cast<Data>();
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      return catProductList;
  }

  Future<void> getCategoryWiseProductList(bool reload, BuildContext context,String categoryId) async {

    if (_categoryWiseProductList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryWiseProductRepoUkrbd.getCategoryWiseProductList(categoryId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _categoryWiseProductList.clear();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        _categoryWiseProduct = CategoryWiseProduct.fromJson(apiResponse.response.data);
        _categoryWiseProductList=_categoryWiseProduct.products.data.cast<Data>();
        _categorySelectedIndex = 0;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }

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