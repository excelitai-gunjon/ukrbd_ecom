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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textTheme.bodyText1.color,
            showUnselectedLabels: true,
            currentIndex: _pageIndex,
            type: BottomNavigationBarType.fixed,
            items: _getBottomWidget(true),
            onTap: (int index) {
              print("index index index :-------------- ${index}");
              _setPage(index);
            },
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
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
      // _list.add(_barItem(Images.message_image, getTranslated('inbox', context), 1));
      _list.add(_barItem(Images.shopping_image, getTranslated('orders', context), 1));
      // _list.add(_barItem(Images.notification, getTranslated('notification', context), 3));
      _list.add(_barItem(Images.profile_icon_image, getTranslated('PROFILE', context), 2));
      // _list.add(_barItem(Images.more_image, getTranslated('more', context), 4));
      _list.add(_barItem(Images.cart_image, getTranslated('CART', context), 3));
    }else{
      _list.add(_barItem(Images.home_image, getTranslated('home', context), 0));
      // _list.add(_barItem(Images.message_image, getTranslated('inbox', context), 1));
      _list.add(_barItem(Images.shopping_image, getTranslated('orders', context), 1));
      // _list.add(_barItem(Images.notification, getTranslated('notification', context), 3));
      _list.add(_barItem(Images.profile_icon_image, getTranslated('PROFILE', context), 2));
      // _list.add(_barItem(Images.more_image, getTranslated('more', context), 4));
      _list.add(_barItem(Images.cart_image, getTranslated('CART', context), 3));
    }

    return _list;
  }

}