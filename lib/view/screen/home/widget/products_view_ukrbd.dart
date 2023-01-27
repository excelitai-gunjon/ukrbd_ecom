// import 'package:flutter/material.dart';
// import 'package:ecom_ukrbd/data/model/response/product_model.dart';
// import 'package:ecom_ukrbd/helper/product_type.dart';
// import 'package:ecom_ukrbd/localization/language_constrants.dart';
// import 'package:ecom_ukrbd/provider/product_provider.dart';
// import 'package:ecom_ukrbd/provider/theme_provider.dart';
// import 'package:ecom_ukrbd/utill/color_resources.dart';
// import 'package:ecom_ukrbd/utill/custom_themes.dart';
// import 'package:ecom_ukrbd/utill/dimensions.dart';
// import 'package:ecom_ukrbd/view/basewidget/product_shimmer.dart';
// import 'package:ecom_ukrbd/view/basewidget/product_widget.dart';
// import 'package:ecom_ukrbd/view/screen/search/search_screen.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:provider/provider.dart';
//
// class ProductViewUkrbd extends StatefulWidget {
//   final bool isHomePage;
//   final ProductType productType;
//   final ScrollController scrollController;
//   final String sellerId;
//   ProductViewUkrbd({@required this.isHomePage, @required this.productType, this.scrollController, this.sellerId});
//
//   @override
//   State<ProductViewUkrbd> createState() => _ProductViewUkrbdState();
// }
//
// class _ProductViewUkrbdState extends State<ProductViewUkrbd> {
//
//   final ScrollController _scrollController = ScrollController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     // int offset = 1;
//     // widget.scrollController?.addListener(() {
//     //   if(widget.scrollController.position.maxScrollExtent == widget.scrollController.position.pixels
//     //       && Provider.of<ProductProvider>(context, listen: false).latestProductList.length != 0
//     //       && !Provider.of<ProductProvider>(context, listen: false).filterIsLoading) {
//     //     int pageSize;
//     //     if(widget.productType == ProductType.BEST_SELLING || widget.productType == ProductType.TOP_PRODUCT || widget.productType == ProductType.NEW_ARRIVAL ) {
//     //       pageSize = (Provider.of<ProductProvider>(context, listen: false).latestPageSize/10).ceil();
//     //       offset = Provider.of<ProductProvider>(context, listen: false).lOffset;
//     //     }
//     //
//     //     else if(widget.productType == ProductType.SELLER_PRODUCT) {
//     //       pageSize = (Provider.of<ProductProvider>(context, listen: false).sellerPageSize/10).ceil();
//     //       offset = Provider.of<ProductProvider>(context, listen: false).sellerOffset;
//     //     }
//     //     if(offset < pageSize) {
//     //       print('offset =====>$offset and page sige ====>$pageSize');
//     //       offset++;
//     //
//     //       print('end of the page');
//     //       Provider.of<ProductProvider>(context, listen: false).showBottomLoader();
//     //
//     //
//     //       if(widget.productType == ProductType.SELLER_PRODUCT) {
//     //         Provider.of<ProductProvider>(context, listen: false).initSellerProductList(widget.sellerId, offset, context);
//     //       }else{
//     //         Provider.of<ProductProvider>(context, listen: false).getLatestProductList(offset, context);
//     //       }
//     //
//     //     }else{
//     //
//     //     }
//     //   }
//     //
//     // });
//
//     return Consumer<ProductProviderU>(
//       builder: (context, prodProvider, child) {
//         List<Product> productList = [];
//         if(widget.productType == ProductType.LATEST_PRODUCT) {
//           productList = prodProvider.lProductList;
//         }
//         else if(widget.productType == ProductType.FEATURED_PRODUCT) {
//           productList = prodProvider.featuredProductList;
//         }else if(widget.productType == ProductType.MENS_FASHION_PRODUCT) {
//           productList = prodProvider.featuredProductList;
//         }else if(widget.productType == ProductType.MOBILE_PRODUCT) {
//           productList = prodProvider.featuredProductList;
//         }else if(widget.productType == ProductType.TOP_PRODUCT) {
//           productList = prodProvider.latestProductList;
//         }else if(widget.productType == ProductType.BEST_SELLING) {
//           productList = prodProvider.latestProductList;
//         }else if(widget.productType == ProductType.NEW_ARRIVAL) {
//           productList = prodProvider.latestProductList;
//         }
//
//         else if(widget.productType == ProductType.SELLER_PRODUCT) {
//           productList = prodProvider.sellerProductList;
//           print('==========>Product List ==${prodProvider.firstLoading}====>${productList.length}');
//         }
//
//         print('========hello hello===>${productList.length}');
//
//         return Column(
//           //controller: _scrollController,
//             children: [
//               // SliverPersistentHeader(
//               //   pinned: true,
//               //   delegate: SliverDelegate(
//               //     child: InkWell(
//               //       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
//               //       child: Container(padding: EdgeInsets.symmetric(
//               //           horizontal: Dimensions.HOME_PAGE_PADDING, vertical: Dimensions.PADDING_SIZE_SMALL,),
//               //         color: ColorResources.getHomeBg(context),
//               //         alignment: Alignment.center,
//               //         child: Container(padding: EdgeInsets.only(
//               //           left: Dimensions.HOME_PAGE_PADDING, right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//               //           top: Dimensions.PADDING_SIZE_EXTRA_SMALL, bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
//               //         ),
//               //           height: 60, alignment: Alignment.centerLeft,
//               //           decoration: BoxDecoration(color: Theme.of(context).cardColor,
//               //             boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
//               //             900 : 200], spreadRadius: 1, blurRadius: 1)],
//               //             // border: Border.all(color: Color(0xff242424)),
//               //             border: Border.all(color: Colors.grey),
//               //             borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),),
//               //           child: Row(mainAxisAlignment : MainAxisAlignment.start, children: [
//               //
//               //             // Container(
//               //             //   width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
//               //             //     borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
//               //             // ),
//               //             //   child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
//               //             // ),
//               //             // Icon(Icons.search, color: Theme.of(context).primaryColor, size: Dimensions.ICON_SIZE_LARGE),
//               //             // Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_LARGE),
//               //             Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_DEFAULT),
//               //             Text(getTranslated('SEARCH_HINT', context),
//               //               style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
//               //             ),
//               //
//               //             // Container(
//               //             //   width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
//               //             //     borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
//               //             // ),
//               //             //   child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
//               //             // ),
//               //           ]),
//               //         ),
//               //       ),
//               //     ),),),
//
//           !prodProvider.filterFirstLoading ? productList.length != 0 ?
//           StaggeredGridView.countBuilder(
//             itemCount: widget.isHomePage? productList.length>4?
//             4:productList.length:productList.length,
//             crossAxisCount: 2,
//             padding: EdgeInsets.all(0),
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
//             itemBuilder: (BuildContext context, int index) {
//               return ProductWidget(productModel: productList[index]);
//             },
//           ) : SizedBox.shrink(): ProductShimmer(isHomePage: widget.isHomePage ,isEnabled: prodProvider.firstLoading),
//
//           prodProvider.filterIsLoading ? Center(child: Padding(
//             padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
//             child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
//           )) : SizedBox.shrink(),
//
//         ]);
//       },
//     );
//   }
// }
//
// class SliverDelegate extends SliverPersistentHeaderDelegate {
//   Widget child;
//   SliverDelegate({@required this.child});
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }
//
//   @override
//   double get maxExtent => 70;
//
//   @override
//   double get minExtent => 70;
//
//   @override
//   bool shouldRebuild(SliverDelegate oldDelegate) {
//     return oldDelegate.maxExtent != 70 || oldDelegate.minExtent != 70 || child != oldDelegate.child;
//   }
// }
//
