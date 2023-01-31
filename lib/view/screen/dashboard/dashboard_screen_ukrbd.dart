import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/helper/network_info.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/view/screen/auth/auth_screen_ukrbd.dart';

import 'package:ecom_ukrbd/view/screen/cart/cart_screen_ukrbd.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/screen/home/home_screens_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/order/order_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/profile/profile_screen_ukrbd.dart';
import 'package:provider/provider.dart';

class DashBoardScreenUkrbd extends StatefulWidget {
  static const String routeName = "/dashBoardScreenUkrbd";

  @override
  _DashBoardScreenUkrbdState createState() => _DashBoardScreenUkrbdState();
}

class _DashBoardScreenUkrbdState extends State<DashBoardScreenUkrbd> {
  PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens ;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  // bool singleVendor = false;
  @override
  void initState() {
    super.initState();

    _screens = [
      HomePageUkrbd(),
      // OrderScreen(isBacButtonExist: false),
      OrderScreenUkrbd(),
      // AuthScreenUkrbd(),
      ProfileScreenUkrbd(),
      CartScreenUkrbd(),
    ];
    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context,bottomNavigationBarProvider,child){
        return WillPopScope(
          onWillPop: () async {
            if(_pageIndex != 0) {
              _setPage(0);
              return false;
            }else {
              return true;
            }
          },
          child: Scaffold(
            key: _scaffoldKey,
            bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context, true),
            backgroundColor: ColorResources.getHomeBg(context),
            resizeToAvoidBottomInset: false,
            body: bottomNavigationBarProvider.getWidget(bottomNavigationBarProvider.selectedIndex),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    if(index==3){
      return BottomNavigationBarItem(
        icon: Consumer<CartProviderUkrbd>(
          builder: (context,cartProviderUkrbd,child){
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(icon, color: index == _pageIndex ?
                Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                  height: 25, width: 25,
                ),
                Positioned(
                  top: -7.5,
                    right: -7.5,
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 15,
                    width: 15,
                    color: Colors.red,
                    child: Center(
                      child: Text("${cartProviderUkrbd.totalItem}",style: TextStyle(
                        color: Colors.white,fontSize: 10
                      ),),
                    ),
                  ),
                ))
              ],
            );
          },
        ),
        label: label,
      );
    }
    return BottomNavigationBarItem(
      icon: Image.asset(icon, color: index == _pageIndex ?
      Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
        height: 25, width: 25,
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      print("index index index :-------------- ${pageIndex}");
      print("index index index :-------------- ${pageIndex}");
      print("index index index :-------------- ${pageIndex}");
      print("index index index :-------------- ${pageIndex}");
      print("index index index :-------------- ${pageIndex}");
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  List<BottomNavigationBarItem> _getBottomWidget(bool isSingleVendor) {
    List<BottomNavigationBarItem> _list = [];
    if(!isSingleVendor){
      _list.add(_barItem(Images.home_image, getTranslated('home', context), 0));
      _list.add(_barItem(Images.shopping_image, getTranslated('orders', context), 1));
      _list.add(_barItem(Images.profile_icon_image, getTranslated('PROFILE', context), 2));
      _list.add(_barItem(Images.cart_image, getTranslated('CART', context), 3));
    }else{
      _list.add(_barItem(Images.home_image, getTranslated('home', context), 0));
      _list.add(_barItem(Images.shopping_image, getTranslated('orders', context), 1));
      _list.add(_barItem(Images.profile_icon_image, getTranslated('PROFILE', context), 2));
      _list.add(_barItem(Images.cart_image, getTranslated('CART', context), 3));
    }

    return _list;
  }

}