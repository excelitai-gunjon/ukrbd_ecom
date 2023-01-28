

import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/base/api_response.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';


import 'package:ecom_ukrbd/helper/api_checker_ukrbd.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../data/model/response/ukrbd/all_categorywise_product_models.dart';
import '../data/repository/all_category_wise_product_repo_ukrbd.dart';


class AllCategoryWiseProductProviderUkrbd with ChangeNotifier{

  final AllCategoryWiseProductRepoUkrbd allCategoryWiseProductRepoUkrbd;

  AllCategoryWiseProductProviderUkrbd({@required this.allCategoryWiseProductRepoUkrbd});


  bool _isLoading=false;
  AllCategoryWiseProduct _allCategoryWiseProduct;
  AllCategoryWiseProductModel _allCategoryWiseProductModel;
  List<AllCategoryWiseProduct> _allCategoryList=[];
  List<Products> _allCategoryWiseProductList=[];

  bool get isLoading=>_isLoading;
  AllCategoryWiseProduct get allCategoryWiseProduct => _allCategoryWiseProduct;
  AllCategoryWiseProductModel get allCategoryWiseProductModel => _allCategoryWiseProductModel;
  List<AllCategoryWiseProduct> get allCategoryList => _allCategoryList;
  List<Products> get allCategoryWiseProductList => _allCategoryWiseProductList;


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



  Future<void> getAllCategoryWiseProductList( BuildContext context) async {

    _isLoading=true;
    _allCategoryList=[];
    _allCategoryWiseProductList=[];
    ApiResponse apiResponse = await allCategoryWiseProductRepoUkrbd.getAllCategoryWiseProductList();


    if (apiResponse.response!= null && apiResponse.response.statusCode == 200) {

      _isLoading = false;

      _allCategoryWiseProductModel = AllCategoryWiseProductModel.fromJson(apiResponse.response.data);
      _allCategoryList=_allCategoryWiseProductModel.allCategoryWiseProduct;
      _allCategoryList.forEach((element) {
        _allCategoryWiseProductList=_allCategoryWiseProductList+element.products;
      });
      notifyListeners();
      getCategoryWiseProductList();
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
    }

    notifyListeners();

  }

  getCategoryWiseProductList(){

    print("Load Category function");

    List<Products> productList=[];
    if(_allCategoryList.length>0){
      print(_allCategoryList.length);

      _allCategoryList.where((element) {
        print("in=======>where"+element.id.toString());
        if(element.id.toString().isNotEmpty){
          print("in=======>element.id.toString().isNotEmpty"+element.id.toString());


          productList=element.products;
          if(element.id.toString()=="76"){
            mensFashionList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="56"){
            electricalAndLightingList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="80"){
            ladiesFashionList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="55"){
            computerAndItList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="71"){
            mobileList=productList;
            notifyListeners();
          }

          if(element.id.toString()=="78"){
            fragrancesListList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="75"){
            networkingList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="79"){
            kidsFashionList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="74"){
            healthAndHerdsList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="52"){
            stationaryAndOfficeList=productList;
            notifyListeners();
          }

          if(element.id.toString()=="58"){
            electronicsAndAppliancesList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="63"){
            roboticsAndArtificialIntelligenceList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="65"){
            labEquipmentList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="66"){
            furnitureList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="69"){
            softwareServiceAndSolutionList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="81"){
            comforterList=productList;
            notifyListeners();
          }
          if(element.id.toString()=="82"){
            winterCollectionList=productList;
            notifyListeners();
          }

          return false;
        }
        return false;
      }).toList();
    }
  }

}


