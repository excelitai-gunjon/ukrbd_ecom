import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:ecom_ukrbd/data/datasource/remote/dio/ukrbd_dio_client.dart';
import 'package:ecom_ukrbd/data/repository/all_category_wise_product_repo_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/auth_repo.dart';
import 'package:ecom_ukrbd/data/repository/auth_repo_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/banner_repo_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/category_repo_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/category_wise_product_repo.dart';
import 'package:ecom_ukrbd/data/repository/onboarding_repo.dart';
import 'package:ecom_ukrbd/data/repository/order_place_repo.dart';
import 'package:ecom_ukrbd/data/repository/product_details_repo_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/profile_repo_ukrbd.dart';
import 'package:ecom_ukrbd/data/repository/splash_repo.dart';
import 'package:ecom_ukrbd/data/repository/sub_category_wise_product_repo_ukrbd.dart';
import 'package:ecom_ukrbd/helper/network_info.dart';
import 'package:ecom_ukrbd/provider/all_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/banner_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/facebook_login_provider.dart';
import 'package:ecom_ukrbd/provider/google_sign_in_provider.dart';
import 'package:ecom_ukrbd/provider/onboarding_provider.dart';
import 'package:ecom_ukrbd/provider/order_place_provider.dart';
import 'package:ecom_ukrbd/provider/product_details_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/profile_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/provider/sub_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  ///https://ukrbd.mycompile.xyz
  sl.registerLazySingleton(() => DioClientUkrbd(AppConstants.UKRBD_BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));


  // Repository
  ///ukrbd
  sl.registerLazySingleton(() => CategoryRepoUkrbd(dioClient: sl()));
  sl.registerLazySingleton(() => AllCategoryWiseProductRepoUkrbd(dioClient: sl()));
  sl.registerLazySingleton(() => CategoryWiseProductRepoUkrbd(dioClient: sl()));
  sl.registerLazySingleton(() => SubCategoryWiseProductRepoUkrbd(dioClient: sl()));
  sl.registerLazySingleton(() => BannerRepoUkrbd(dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepoUkrbd(dioClient: sl(),sharedPreferences: sl()));
  sl.registerLazySingleton(() => AuthRepoUkrbd(dioClient: sl(),sharedPreferences: sl()));
  sl.registerLazySingleton(() => ProductDetailsRepoUkrbd(dioClient: sl()));
  sl.registerLazySingleton(() => OnBoardingRepo());
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => OrderPlaceRepo(sharedPreferences: sl(), dioClient: sl()));

  // Provider
  ///ukrbd  CategoryProviderUkrbd

  sl.registerFactory(() => CategoryProviderUkrbd(categoryRepo: sl()));
  sl.registerFactory(() => OrderPlaceProvider(orderPlaceRepo: sl()));
  sl.registerFactory(() => AllCategoryWiseProductProviderUkrbd(allCategoryWiseProductRepoUkrbd: sl()));
  sl.registerFactory(() => CategoryWiseProductProviderUkrbd(categoryWiseProductRepoUkrbd: sl()));
  sl.registerFactory(() => SubCategoryWiseProductProviderUkrbd(subCategoryWiseProductRepoUkrbd: sl()));
  sl.registerFactory(() => CartProviderUkrbd(sharedPreferences: sl()));
  sl.registerFactory(() => BannerProviderUkrbd(bannerRepoUkrbd: sl()));
  sl.registerFactory(() => BottomNavigationBarProvider());
  sl.registerFactory(() => AuthProviderUkrbd(authRepoUkrbd: sl()));
  sl.registerFactory(() => ProfileProviderUkrbd(profileRepo: sl()));
  sl.registerFactory(() => ProductDetailsProviderUkrbd(productDetailsRepoUkrbd: sl()));
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => GoogleSignInProvider());
  sl.registerFactory(() => FacebookLoginProvider());


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
