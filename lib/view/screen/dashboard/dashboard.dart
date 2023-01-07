
import 'dart:io';

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

import '../../../provider/bottom_navigation_bar_provider.dart';




class DashBoard extends StatefulWidget {

  static const String routeName = "/dashBoard";
  const DashBoard({Key key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens ;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // _screens = [
    //   HomePageUkrbd(),
    //   // OrderScreen(isBacButtonExist: false),
    //   OrderScreenUkrbd(),
    //   // AuthScreenUkrbd(),
    //   ProfileScreenUkrbd(),
    //   CartScreenUkrbd(),
    // ];


   // NetworkInfo.checkConnectivity(context);


  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(


        builder: (context, bottomNavigationBarProvider, child){

          return WillPopScope(
            onWillPop: () async {

              if(bottomNavigationBarProvider.selectedIndex!=0 ){
                bottomNavigationBarProvider.updateSelectedIndex();
              }

              else{
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text("Alert"),
                      content: Text("Do you want to exit??"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("No")),
                        TextButton(onPressed: (){
                          exit(0);
                        }, child: Text("Yes")),
                      ],
                    );
                  },
                );
              }
              return ;
            },
            child: Scaffold(

              body: bottomNavigationBarProvider.getWidget(bottomNavigationBarProvider.selectedIndex),

              bottomNavigationBar:
              bottomNavigationBarProvider.bottomNavigationBar(context, true),


            ),
          );




        }
    ) ;
  }



}
