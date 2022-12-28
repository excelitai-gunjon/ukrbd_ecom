import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/categories_ukrbd.dart';
import 'package:ecom_ukrbd/data/model/response/category_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/category_repo_ukrbd.dart';
import 'package:ecom_ukrbd/helper/api_checker.dart';

class CategoryProviderUkrbd extends ChangeNotifier {
  final CategoryRepoUkrbd categoryRepo;

  CategoryProviderUkrbd({@required this.categoryRepo});


  List<Categories> _categoryList = [];
  int _categorySelectedIndex;

  List<Categories> get categoryList => _categoryList;
  int get categorySelectedIndex => _categorySelectedIndex;

  Future<void> getCategoryList(bool reload, BuildContext context) async {
    if (_categoryList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryRepo.getCategoryList();
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _categoryList.clear();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        CategoryUkrbd categoryUkrbd = CategoryUkrbd.fromJson(apiResponse.response.data);
        _categoryList=categoryUkrbd.categories;
        _categorySelectedIndex = 0;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }
  }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }
}
