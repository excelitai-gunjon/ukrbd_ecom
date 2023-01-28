import 'dart:io';
import 'package:ecom_ukrbd/provider/all_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/provider/product_details_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/profile_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/cart/cart_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/checkout/checkout_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/dashboard/dashboard.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/product_details_screen_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ecom_ukrbd/provider/banner_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/facebook_login_provider.dart';
import 'package:ecom_ukrbd/provider/google_sign_in_provider.dart';
import 'package:ecom_ukrbd/provider/sub_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/onboarding_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/theme/dark_theme.dart';
import 'package:ecom_ukrbd/theme/light_theme.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:ecom_ukrbd/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'helper/custom_delegate.dart';
import 'localization/app_localization.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MultiProvider(
    providers: [
      ///ukrbd
      ChangeNotifierProvider(create: (context) => di.sl<CategoryProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<CategoryWiseProductProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<SubCategoryWiseProductProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<CartProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<BannerProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<BottomNavigationBarProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProfileProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductDetailsProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<AllCategoryWiseProductProviderUkrbd>()),

      ///
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GoogleSignInProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FacebookLoginProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //final int orderId;
  //MyApp();

  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    AppConstants.languages.forEach((language) {
      _locals.add(Locale(language.languageCode, language.countryCode));
    });
    return MaterialApp(
      title: AppConstants.APP_NAME,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      // locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackLocalizationDelegate()
      ],
     initialRoute:SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        DashBoard.routeName: (context) => DashBoard(),
        //DashBoardScreenUkrbd.routeName: (context) => DashBoardScreenUkrbd(),
        // SearchScreen.routeName: (context) => SearchScreen(),
        BrandAndCategoryProductScreenUkrbd.routeName: (context) => BrandAndCategoryProductScreenUkrbd(),
        ProductDetailsScreenUkrbd.routeName: (context) => ProductDetailsScreenUkrbd(),
        CartScreenUkrbd.routeName: (context) => CartScreenUkrbd(),
        CheckoutUkrbd.routeName: (context) => CheckoutUkrbd(),
      },
      supportedLocales: _locals,
      // home: orderId == null ? SplashScreen() : OrderDetailsScreen(orderModel: null,
      //   orderId: orderId, orderType: 'default_type',isNotification: true),
      // home: HomePage(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}