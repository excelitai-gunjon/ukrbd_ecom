

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartProviderUkrbd with ChangeNotifier{
  final SharedPreferences sharedPreferences;

  CartProviderUkrbd({this.sharedPreferences});

  List<Products> _cartList=[];
  List<int> _itemCound=[];
  int _totalItem=0;
  int _subTotal=0;



  List<Products> get cartList=>_cartList;
  List<int> get itemCount=>_itemCound;
  int get subTotal => _subTotal;
  int get totalItem => _totalItem;



  void plus(int index,Products productData){
    _itemCound[index]++;
    _totalItem=_totalItem+1;
    _subTotal= int.tryParse(productData.salesPrice)+_subTotal;
    notifyListeners();
  }

  void minus(int index,Products productData){
    _itemCound[index]--;
    _totalItem=_totalItem-1;
    _subTotal= _subTotal-int.tryParse(productData.salesPrice);
    notifyListeners();
  }

  void deleteCartItem(Products productData){
    _totalItem=_totalItem-1;
    _subTotal= _subTotal-int.tryParse(productData.salesPrice);
    // Data productModelData =_cartList.;
    _cartList.removeWhere((element) => element==productData);
    notifyListeners();
  }

  void deleteOneCartItem(int index,Products productData){
    _totalItem=_totalItem-_itemCound[index];
    _subTotal= _subTotal-_itemCound[index]*int.tryParse(productData.salesPrice);
    _cartList.removeWhere((element) => element==productData);
    notifyListeners();
  }

  void deleteCart(){
    _totalItem=0;
    _subTotal= 0;
    _itemCound.clear();
    _cartList.clear();
    notifyListeners();
  }


  void addToCart(Products productModel,int count,BuildContext context){

    _subTotal= int.tryParse(productModel.salesPrice)*count+_subTotal;
    _totalItem=_totalItem+count;
    _cartList.contains(productModel)?

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: const Text('Already Added!',   style: TextStyle(
    //     color: Colors.black87,
    //   ),),
    //   backgroundColor:   Theme.of(context).primaryColor,
    //   elevation: 3.0,
    //   duration: Duration(seconds: 1),
    //   behavior: SnackBarBehavior.floating,
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(5))),
    //   // action: SnackBarAction(
    //   //   label: 'dismiss',
    //   //   onPressed: () {},
    //   // ),
    // )):_cartList.add(productModel);

    SizedBox():_cartList.add(productModel);



    List<String> carts = [];
    // _cartList.add(productModel);
    _itemCound.add(count);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Product Added!',   style: TextStyle(
        color: Colors.black87,
      ),),
      backgroundColor:   Theme.of(context).primaryColor,
      elevation: 3.0,
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      // action: SnackBarAction(
      //   label: 'dismiss',
      //   onPressed: () {},
      // ),
    ));


    // _cartList.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
    // sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
    notifyListeners();
  }

  List<Products> getCartList() {
    List<String> carts = sharedPreferences.getStringList(AppConstants.CART_LIST);
    List<Products> cartList = [];
    carts.forEach((cart) => cartList.add(Products.fromJson(jsonDecode(cart))) );
    notifyListeners();
    return cartList;
  }

// void addToCartList(List<Data> productModel) {
//   List<String> carts = [];
//   productModel.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
//   sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
// }
}

class CartModel{


}