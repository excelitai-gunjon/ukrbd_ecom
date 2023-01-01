import 'dart:io';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/view/screen/cart/cart_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/checkout/checkout_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/dashboard/dashboard.dart';
import 'package:ecom_ukrbd/view/screen/dashboard/dashboard_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/home_screens_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/order/order_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/ProductDetailsScreenUkrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/profile/profile_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/search/search_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ecom_ukrbd/provider/banner_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/facebook_login_provider.dart';
import 'package:ecom_ukrbd/provider/featured_deal_provider.dart';
import 'package:ecom_ukrbd/provider/google_sign_in_provider.dart';
import 'package:ecom_ukrbd/provider/home_category_product_provider.dart';
import 'package:ecom_ukrbd/provider/location_provider.dart';
import 'package:ecom_ukrbd/provider/sub_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/top_seller_provider.dart';
import 'package:ecom_ukrbd/provider/wallet_transaction_provider.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/brand_provider.dart';
import 'package:ecom_ukrbd/provider/cart_provider.dart';
import 'package:ecom_ukrbd/provider/chat_provider.dart';
import 'package:ecom_ukrbd/provider/coupon_provider.dart';
import 'package:ecom_ukrbd/provider/localization_provider.dart';
import 'package:ecom_ukrbd/provider/notification_provider.dart';
import 'package:ecom_ukrbd/provider/onboarding_provider.dart';
import 'package:ecom_ukrbd/provider/order_provider.dart';
import 'package:ecom_ukrbd/provider/profile_provider.dart';
import 'package:ecom_ukrbd/provider/search_provider.dart';
import 'package:ecom_ukrbd/provider/seller_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/provider/support_ticket_provider.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/provider/wishlist_provider.dart';
import 'package:ecom_ukrbd/theme/dark_theme.dart';
import 'package:ecom_ukrbd/theme/light_theme.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:ecom_ukrbd/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'helper/custom_delegate.dart';
import 'localization/app_localization.dart';
import 'notification/my_notification.dart';
import 'provider/product_details_provider.dart';
import 'provider/banner_provider.dart';
import 'provider/flash_deal_provider.dart';
import 'provider/product_provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FlutterDownloader.initialize(debug: true , ignoreSsl: true);
  await di.init();
  // final NotificationAppLaunchDetails notificationAppLaunchDetails =
  // await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  // int _orderID;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   _orderID = (notificationAppLaunchDetails.payload != null && notificationAppLaunchDetails.payload.isNotEmpty)
  //       ? int.parse(notificationAppLaunchDetails.payload) : null;
  // }
  // final RemoteMessage remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  // if (remoteMessage != null) {
  //   _orderID = remoteMessage.notification.titleLocKey != null ? int.parse(remoteMessage.notification.titleLocKey) : null;
  // }
  //print('========-notification-----$_orderID----===========');

  // await MyNotification.initialize(flutterLocalNotificationsPlugin);
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (context) => di.sl<CategoryProvider>()),
      ///ukrbd
      ChangeNotifierProvider(create: (context) => di.sl<CategoryProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<CategoryWiseProductProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<SubCategoryWiseProductProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<CartProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<BannerProviderUkrbd>()),
      ChangeNotifierProvider(create: (context) => di.sl<BottomNavigationBarProvider>()),


      ChangeNotifierProvider(create: (context) => di.sl<AuthProviderUkrbd>()),

      ///
      ChangeNotifierProvider(create: (context) => di.sl<HomeCategoryProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<TopSellerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FlashDealProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FeaturedDealProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<BrandProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<BannerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductDetailsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SearchProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SellerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CouponProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OrderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<NotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<WishListProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SupportTicketProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GoogleSignInProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FacebookLoginProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<WalletTransactionProvider>()),
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
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackLocalizationDelegate()
      ],

     //initialRoute:DashBoard.routeName,
   //  initialRoute:DashBoardScreenUkrbd.routeName,
     initialRoute:SplashScreen.routeName,



     // initialRoute: authProvider.getUserToken().isEmpty?LoginScreen.routeName:LandingPage.routeName,

      ///
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
     //   DashBoard.routeName: (context) => DashBoard(),
        DashBoardScreenUkrbd.routeName: (context) => DashBoardScreenUkrbd(),
        SearchScreen.routeName: (context) => SearchScreen(),
        BrandAndCategoryProductScreenUkrbd.routeName: (context) => BrandAndCategoryProductScreenUkrbd(),
        ProductDetailsScreenUkrbd.routeName: (context) => ProductDetailsScreenUkrbd(),
        CartScreenUkrbd.routeName: (context) => CartScreenUkrbd(),
        CheckoutUkrbd.routeName: (context) => CheckoutUkrbd(),


      },
      supportedLocales: _locals,
      // home: orderId == null ? SplashScreen() : OrderDetailsScreen(orderModel: null,
      //   orderId: orderId, orderType: 'default_type',isNotification: true),
    // home: SplashScreen(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}