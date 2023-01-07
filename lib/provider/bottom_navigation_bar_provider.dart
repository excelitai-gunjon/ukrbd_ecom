
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../localization/language_constrants.dart';
import '../utill/color_resources.dart';
import '../utill/images.dart';
import '../view/screen/cart/cart_screen_ukrbd.dart';
import '../view/screen/dashboard/dashboard.dart';
import '../view/screen/dashboard/dashboard_screen_ukrbd.dart';
import '../view/screen/home/home_screens_ukrbd.dart';
import '../view/screen/order/order_screen_ukrbd.dart';
import '../view/screen/profile/profile_screen_ukrbd.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  String _title = "DashBoard";

  int get selectedIndex => _selectedIndex;
  String get title => _title;

  void updateSelectedIndex(){
    _selectedIndex=0;
    notifyListeners();
  }

  // final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom == 0;

  Widget floatingActionButton(BuildContext context,bool islanding) {
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom == 0;
    return Visibility(
      visible: keyboardIsOpen,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0xFF0B4461)),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image:
                    AssetImage("assets/images/add_parcel_button.png"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        onPressed: () {
          onItemTapped(1, islanding, context);

        },
      ),
    );
  }

  Widget bottomNavigationBar(BuildContext context,bool isDashBoardScreen) {
    return BottomNavigationBar(
      //elevation: 9,
     // backgroundColor: ,
      showSelectedLabels:true,
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).textTheme.bodyText1.color,
      onTap: (index){
        onItemTapped(index,isDashBoardScreen,context);
      },

      items:   [
      BottomNavigationBarItem(
        icon: Image.asset(
          Images.home_image,
          color: ColorResources.BOTTOMNAVIGATIONBARITEMCOLOR,
          height: 25, width: 25,
        ),
        label: getTranslated('home', context),
      ),

        BottomNavigationBarItem(
          icon: Image.asset(
            Images.shopping_image,
            color: ColorResources.BOTTOMNAVIGATIONBARITEMCOLOR,
            height: 25, width: 25,
          ),
          label: getTranslated('orders', context),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.profile_icon_image,
            color: ColorResources.BOTTOMNAVIGATIONBARITEMCOLOR,

            height: 25, width: 25,
          ),
          label: getTranslated('PROFILE', context),
        ),
        BottomNavigationBarItem(
          icon: Consumer<CartProviderUkrbd>(
            builder: (context,cartProviderUkrbd,child){
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Images.cart_image,
                    color: ColorResources.BOTTOMNAVIGATIONBARITEMCOLOR,

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
          label: getTranslated('CART', context),
        ),



      ],
     
    );
  }



  Widget getWidget(int index) {
    if (index == 0 ) {
      return    HomePageUkrbd();
    }
    if (index == 1 ) {
      return  OrderScreenUkrbd();
    }
    if (index == 2) {
      return  ProfileScreenUkrbd();
    }
    if (index == 3) {
      return   CartScreenUkrbd();
    }
  }

  String getTitle(int selectedIndex) {
    if (selectedIndex == 0 ) {
      return "DashBoard";
    }
    if (selectedIndex == 2 ) {
      return "My Profile";
    }
    if (selectedIndex == 1) {
      return "Add Parcel";
    }
  }

  void onItemTapped(int index, bool isDashBoardScreen,BuildContext context) {
    _selectedIndex = index;
    notifyListeners();
    if(!isDashBoardScreen){
      Navigator.pushReplacementNamed(context, DashBoard.routeName);
    }
    //tap=false;
  }




}