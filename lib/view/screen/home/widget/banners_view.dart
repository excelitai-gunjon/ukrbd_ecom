// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/brand_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/provider/top_seller_provider.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
// import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/topSeller/top_seller_product_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// class BannersView extends StatelessWidget {
//
//   _clickBannerRedirect(BuildContext context, int id, Product product,  String type){
//
//     final cIndex =  Provider.of<CategoryProvider>(context, listen: false).categoryList.indexWhere((element) => element.id == id);
//     final bIndex =  Provider.of<BrandProvider>(context, listen: false).brandList.indexWhere((element) => element.id == id);
//     final tIndex =  Provider.of<TopSellerProvider>(context, listen: false).topSellerList.indexWhere((element) => element.id == id);
//
//
//     if(type == 'category'){
//       if(Provider.of<CategoryProvider>(context, listen: false).categoryList[cIndex].name != null){
//         Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
//           isBrand: false,
//           id: id.toString(),
//           name: '${Provider.of<CategoryProvider>(context, listen: false).categoryList[cIndex].name}',
//         )));
//       }
//
//     }else if(type == 'product'){
//       if(product != null) {
//         Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(
//           productId: product.id,slug: product.slug,
//         )));
//       }
//
//     }else if(type == 'brand'){
//       if(Provider.of<BrandProvider>(context, listen: false).brandList[bIndex].name != null){
//         Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
//           isBrand: true,
//           id: id.toString(),
//           name: '${Provider.of<BrandProvider>(context, listen: false).brandList[bIndex].name}',
//         )));
//       }
//
//     }else if( type == 'shop'){
//       if(Provider.of<TopSellerProvider>(context, listen: false).topSellerList[tIndex].name != null){
//         Navigator.push(context, MaterialPageRoute(builder: (_) => TopSellerProductScreen(
//           topSellerId: id,
//           topSeller: Provider.of<TopSellerProvider>(context,listen: false).topSellerList[tIndex],
//         )));
//       }
//
//     }
//   }
//   final CarouselController _controller = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Consumer<BannerProvider>(
//           builder: (context, bannerProvider, child) {
//
//             List<String> bannerList=BannerModelClass().bannerList;
//             double _width = MediaQuery.of(context).size.width;
//             return Container(
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//               width: _width,
//               height: _width * 0.295,
//               child: bannerProvider.mainBannerList != null ? bannerProvider.mainBannerList.length != 0 ? Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   CarouselSlider.builder(
//                     carouselController: _controller,
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       //enlargeCenterPage: true,
//                       aspectRatio: 2.0,
//                       // onPageChanged: (index, reason) {
//                       //   setState(() {
//                       //     _current = index;
//                       //   });
//                       // }
//                       viewportFraction: 1,
//                       disableCenter: true,
//                       onPageChanged: (index, reason) {
//                         Provider.of<BannerProvider>(context, listen: false).setCurrentIndex(index);
//                       },
//
//                     ),
//                     // itemCount: bannerProvider.mainBannerList.length == 0 ? 1 : bannerProvider.mainBannerList.length,
//                     itemCount: bannerList.length,
//                     itemBuilder: (context, index, _) {
//                       String bannerImage=bannerList[index].toString();
//
//                       // print('${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
//                       //           '/${bannerProvider.mainBannerList[index].photo}');
//
//                       return InkWell(
//                         onTap: () {
//                           // _clickBannerRedirect(context,
//                           //     bannerProvider.mainBannerList[index].resourceId,
//                           //     bannerProvider.mainBannerList[index].resourceType =='product'?
//                           //     bannerProvider.mainBannerList[index].product : null,
//                           //     bannerProvider.mainBannerList[index].resourceType);
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: Image.asset(bannerImage,fit: BoxFit.cover,),
//                             // FadeInImage.assetNetwork(
//                             //   placeholder: Images.placeholder, fit: BoxFit.cover,
//                             //   image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
//                             //       '/${bannerProvider.mainBannerList[index].photo}',
//                             //   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_3x1, fit: BoxFit.cover),
//                             // ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//
//                   Positioned(
//                     bottom: 5,
//                     left: 0,
//                     right: 0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: bannerList.map((banner) {
//                         int index = bannerList.indexOf(banner);
//                         return TabPageSelectorIndicator(
//                           backgroundColor: index == bannerProvider.currentIndex ? Theme.of(context).primaryColor : Colors.grey,
//                           borderColor: index == bannerProvider.currentIndex ? Theme.of(context).primaryColor : Colors.grey,
//                           size: 10,
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ) : Center(child: Text('No banner available')) : Shimmer.fromColors(
//                 baseColor: Colors.grey[300],
//                 highlightColor: Colors.grey[100],
//                 enabled: bannerProvider.mainBannerList == null,
//                 child: Container(margin: EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: ColorResources.WHITE,
//                 )),
//               ),
//             );
//           },
//         ),
//
//         SizedBox(height: 5),
//       ],
//     );
//   }
//
//
// }
//
// class BannerModelClass{
//
//   List<String> bannerList=[
//     "assets/banner/1.jpg",
//     "assets/banner/2.jpg",
//     "assets/banner/3.jpg",
//     "assets/banner/4.jpg",
//     "assets/banner/5.jpg",
//     "assets/banner/6.png",
//     "assets/banner/7.jpg",
//     "assets/banner/8.jpg",
//     "assets/banner/9.jpg",
//     "assets/banner/10.jpg",
//     "assets/banner/11.jpg",
//     "assets/banner/12.jpg",
//     "assets/banner/13.jpg",
//     "assets/banner/14.jpg",
//   ];
//
// }
//
