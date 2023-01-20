

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
  int _categorySelectedIndex;
  List<Products> _categoryWiseProductList=[];
  CategoryWiseProduct _categoryWiseProduct;

  CategoryWiseProduct get categoryWiseProductResponse=>_categoryWiseProduct;

  List<Products> get categoryWiseProductList => _categoryWiseProductList;
  int get categorySelectedIndex => _categorySelectedIndex;




  // CategoryWiseProductViewWidget(id: "76",title: "Men's Fashion",),
  List<Products> mensFashionList=[];
  // CategoryWiseProductViewWidget(id: "80",title: "Ladies Fashion",),
  List<Products> ladiesFashionList=[];
  // CategoryWiseProductViewWidget(id: "55",title: "Computer & IT",),
  List<Products> computerAndItList=[];
  // CategoryWiseProductViewWidget(id: "71",title: "Mobile",),
  List<Products> mobileList=[];
  // CategoryWiseProductViewWidget(id: "78",title: "Fragrances",),
  List<Products> fragrancesListList=[];
  // CategoryWiseProductViewWidget(id: "75",title: "Networking",),
  List<Products> networkingList=[];
  // CategoryWiseProductViewWidget(id: "79",title: "kids Fashion",),
  List<Products> kidsFashionList=[];
  // CategoryWiseProductViewWidget(id: "74",title: "Health & Herbs",),
  List<Products> healthAndHerdsList=[];
  // CategoryWiseProductViewWidget(id: "52",title: "Stationery & Office",),
  List<Products> stationaryAndOfficeList=[];
  // CategoryWiseProductViewWidget(id: "56",title: "Electrical & Lighting",),
  List<Products> electricalAndLightingList=[];
  // CategoryWiseProductViewWidget(id: "58",title: "Electronics & Appliances",),
  List<Products> electronicsAndAppliancesList=[];
  // CategoryWiseProductViewWidget(id: "63",title: "Robotics and Artificial Intelligence",),
  List<Products> roboticsAndArtificialIntelligenceList=[];
  // CategoryWiseProductViewWidget(id: "65",title: "Lab Equipment",),
  List<Products> labEquipmentList=[];
  // CategoryWiseProductViewWidget(id: "66",title: "Furniture",),
  List<Products> furnitureList=[];
  // CategoryWiseProductViewWidget(id: "69",title: "Software Service & Solution",),
  List<Products> softwareServiceAndSolutionList=[];
  // CategoryWiseProductViewWidget(id: "81",title: "Comforter",),
  List<Products> comforterList=[];
  // CategoryWiseProductViewWidget(id: "82",title: "Winter Collection",),
  List<Products> winterCollectionList=[];


  Future<void> getCategoryWiseProductListForHomePage(bool reload, BuildContext context,String categoryId) async {
    List<Products> catProductList;
      ApiResponse apiResponse = await categoryWiseProductRepoUkrbd.getCategoryWiseProductList(categoryId);

      print(apiResponse.response);
      print(apiResponse.response);
      print(apiResponse.response);
      print(apiResponse.response);
      print(apiResponse.response);
      print(apiResponse.response);
      print(apiResponse.response);

      if (apiResponse.response!= null && apiResponse.response.statusCode == 200) {
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        CategoryWiseProduct categoryWiseProduct = CategoryWiseProduct.fromJson(apiResponse.response.data);

        catProductList=categoryWiseProduct.products;

        if(categoryId=="76"){
          mensFashionList=catProductList;
          notifyListeners();
        }
        if(categoryId=="80"){
          ladiesFashionList=catProductList;
          notifyListeners();
        }
        if(categoryId=="55"){
          computerAndItList=catProductList;
          notifyListeners();
        }
        if(categoryId=="71"){
          mobileList=catProductList;
          notifyListeners();
        }

        if(categoryId=="78"){
          fragrancesListList=catProductList;
          notifyListeners();
        }
        if(categoryId=="75"){
          networkingList=catProductList;
          notifyListeners();
        }
        if(categoryId=="79"){
          kidsFashionList=catProductList;
          notifyListeners();
        }
        if(categoryId=="74"){
          healthAndHerdsList=catProductList;
          notifyListeners();
        }
        if(categoryId=="52"){
          stationaryAndOfficeList=catProductList;
          notifyListeners();
        }

        if(categoryId=="58"){
          electronicsAndAppliancesList=catProductList;
          notifyListeners();
        }
        if(categoryId=="63"){
          roboticsAndArtificialIntelligenceList=catProductList;
          notifyListeners();
        }
        if(categoryId=="65"){
          labEquipmentList=catProductList;
          notifyListeners();
        }
        if(categoryId=="66"){
          furnitureList=catProductList;
          notifyListeners();
        }
        if(categoryId=="69"){
          softwareServiceAndSolutionList=catProductList;
          notifyListeners();
        }
        if(categoryId=="81"){
          comforterList=catProductList;
          notifyListeners();
        }
        if(categoryId=="82"){
          winterCollectionList=catProductList;
          notifyListeners();
        }

      } else {
        ApiChecker.checkApi(context, apiResponse);
      }

      notifyListeners();
      // return catProductList;
  }

  Future<void> getCategoryWiseProductList(bool reload, BuildContext context,String categoryId) async {

    if (_categoryWiseProductList.length == 0 || reload) {
      ApiResponse apiResponse = await categoryWiseProductRepoUkrbd.getCategoryWiseProductList(categoryId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _categoryWiseProductList.clear();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        _categoryWiseProduct = CategoryWiseProduct.fromJson(apiResponse.response.data);
        _categoryWiseProductList=_categoryWiseProduct.products;
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