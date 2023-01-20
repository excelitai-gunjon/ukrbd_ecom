import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/profile_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/no_internet_screen.dart';
import 'package:ecom_ukrbd/view/screen/dashboard/dashboard_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/maintenance/maintenance_screen.dart';
import 'package:ecom_ukrbd/view/screen/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget{
  static const String routeName = "/splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
  StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    bool _firstTime = true;
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(!_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 3000 : 0),
          content: Text(
            isNotConnected ? getTranslated('no_connection', context) : getTranslated('connected', context),
            textAlign: TextAlign.center,
          ),
        ));

        if(!isNotConnected) {
           _route();
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
        }
      }
      _firstTime = false;
    });

     _route();
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }



  void _route() async{

    // await Provider.of<BannerProviderUkrbd>(context, listen: false).getBannerList(true, context);
    Provider.of<SplashProvider>(context, listen: false).initConfig(context).then((bool isSuccess) async{

      // await Provider.of<BannerProviderUkrbd>(context, listen: false).getBannerList(true, context).then((value) {
      //   return value;
      // });
     // await Provider.of<CategoryProviderUkrbd>(context, listen: false).getCategoryList(true, context);
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "82");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "81");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "66");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "65");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "63");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "58");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "56");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "52");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "59");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "74");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "79");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "75");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "78");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "80");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "76");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "55");
      await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, "71");


      print(".........................Initial Configuration.......................");

      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardScreen()));
      if(isSuccess) {
        Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
        Timer(Duration(seconds: 1), (){
          if(Provider.of<SplashProvider>(context, listen: false).configModel.maintenanceMode) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MaintenanceScreen()));
          }else {
            if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
              Provider.of<AuthProvider>(context, listen: false).updateToken(context);
              Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashBoardScreenUkrbd()));
            } else {
              if(Provider.of<SplashProvider>(context, listen: false).showIntro()) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => OnBoardingScreen(
                  indicatorColor: ColorResources.GREY, selectedIndicatorColor: Theme.of(context).primaryColor,
                )));
              }else {
                if (!Provider.of<AuthProvider>(context, listen: false).isLoading) {
                  // Provider.of<CartProvider>(context, listen: false).getCartData();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreenUkrbd()),
                          (route) => false);
                }
                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
              }
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Provider.of<SplashProvider>(context).hasConnection?
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorResources.getIconBg(context),
        child:
        Center(
          child: Image.asset(Images.logo_with_name_image, height: 250.0, fit: BoxFit.scaleDown,
              // width: 250.0, color: Theme.of(context).cardColor,),
                        width: 250.0),
        ),
      ):NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
    );
  }

}
