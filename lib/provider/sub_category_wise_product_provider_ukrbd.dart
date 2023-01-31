

import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/sub_category_wise_product/sub_category_wise_product_model.dart';
// import 'package:ecom_ukrbd/data/repository/category_wise_product_repo.dart';
import 'package:ecom_ukrbd/data/repository/sub_category_wise_product_repo_ukrbd.dart';
import 'package:ecom_ukrbd/helper/api_checker_ukrbd.dart';



class SubCategoryWiseProductProviderUkrbd with ChangeNotifier{

  final SubCategoryWiseProductRepoUkrbd subCategoryWiseProductRepoUkrbd;

  SubCategoryWiseProductProviderUkrbd({@required this.subCategoryWiseProductRepoUkrbd});

  bool _isLoading=false;

  int _categorySelectedIndex;
  List<Products> _subCategoryWiseProductList=[];
  SubCategoryWiseProductModel _subCategoryWiseProduct;
  SubCategoryWiseProductModel get subCategoryWiseProduct=>_subCategoryWiseProduct;

  List<Products> get subCategoryWiseProductList => _subCategoryWiseProductList;
  int get categorySelectedIndex => _categorySelectedIndex;
  bool get isLoading=>_isLoading;

  Future<void> getSubCategoryWiseProductList(bool reload, BuildContext context,String categoryId) async {

    _isLoading=true;
    notifyListeners();

    if (_subCategoryWiseProductList.length == 0 || reload) {
      ApiResponse apiResponse = await subCategoryWiseProductRepoUkrbd.getSubCategoryWiseProductList(categoryId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _isLoading=false;
        notifyListeners();
        _subCategoryWiseProductList.clear();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        _subCategoryWiseProduct = SubCategoryWiseProductModel.fromJson(apiResponse.response.data);
        _subCategoryWiseProductList=_subCategoryWiseProduct.products;
        _categorySelectedIndex = 0;
        notifyListeners();
      } else {
        _isLoading=false;
        notifyListeners();
        // ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }

  }

  void clear(){
    _subCategoryWiseProductList.clear();
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