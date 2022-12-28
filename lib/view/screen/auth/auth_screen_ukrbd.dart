import 'package:flutter/material.dart';

import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/profile_provider.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/screen/auth/widget/merchant_registration_form_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/auth/widget/sign_in_widget.dart';
import 'package:ecom_ukrbd/view/screen/auth/widget/sign_in_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/auth/widget/sign_up_widget.dart';
import 'package:ecom_ukrbd/view/screen/auth/widget/sign_up_widget_ukrbd.dart';
import 'package:provider/provider.dart';

class AuthScreenUkrbd extends StatelessWidget{
  final int initialPage;
  AuthScreenUkrbd({this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).initAddressTypeList(context);
    Provider.of<AuthProvider>(context, listen: false).isRemember;
    PageController _pageController = PageController(initialPage: initialPage);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [

          Provider.of<ThemeProvider>(context).darkTheme ? SizedBox()
              : Image.asset(Images.background, fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),

          Consumer<AuthProvider>(
            builder: (context, auth, child) => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimensions.topSpace),
                  Image.asset(Images.logo_with_name_image, height: 150, width: 200),


                  Padding(
                    padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_LARGE),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(bottom: 0,
                          right: Dimensions.MARGIN_SIZE_EXTRA_SMALL, left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1, color: ColorResources.getGainsBoro(context),
                          ),
                        ),


                        Consumer<AuthProvider>(
                          builder: (context,authProvider,child)=>SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => _pageController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeInOut),
                                  child: Column(
                                    children: [
                                      Text(getTranslated('SIGN_IN', context),
                                          style: authProvider.selectedIndex == 0 ?
                                          titilliumSemiBold : titilliumRegular),
                                      Container(
                                        height: 1, width: 40,
                                        margin: EdgeInsets.only(top: 8),
                                        color: authProvider.selectedIndex == 0 ?
                                        Theme.of(context).primaryColor : Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE),


                                InkWell(
                                  onTap: () {
                                    return _pageController.animateToPage(
                                      1,
                                      duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Column(
                                    children: [

                                      Text("Customer Sign Up",//getTranslated('SIGN_UP', context),
                                          style: authProvider.selectedIndex == 1 ?
                                          titilliumSemiBold : titilliumRegular),

                                      Container(height: 1, width: 50,
                                          margin: EdgeInsets.only(top: 8),
                                          color: authProvider.selectedIndex == 1 ?
                                          Theme.of(context).primaryColor : Colors.transparent
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                                InkWell(
                                  onTap: () => _pageController.animateToPage(2,
                                      duration: Duration(seconds: 1), curve: Curves.easeInOut),
                                  child: Column(
                                    children: [

                                      Text("Merchandiser Register Form",//getTranslated('SIGN_UP', context),
                                          style: authProvider.selectedIndex == 2 ?
                                          titilliumSemiBold : titilliumRegular),

                                      Container(height: 1, width: 50,
                                          margin: EdgeInsets.only(top: 8),
                                          color: authProvider.selectedIndex == 2 ?
                                          Theme.of(context).primaryColor : Colors.transparent
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Expanded(
                    child: Consumer<AuthProvider>(
                      builder: (context,authProvider,child)=>PageView.builder(
                        itemCount: 3,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          if (authProvider.selectedIndex == 0) {
                            return SignInWidgetUkrbd();
                          }if (authProvider.selectedIndex == 1) {
                            return SignUpWidgetUkrbd();
                          } else {
                            return MerchantSignUpWidgetUkrbd();
                          }
                        },
                        onPageChanged: (index) {
                          authProvider.updateSelectedIndex(index);
                        },
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

