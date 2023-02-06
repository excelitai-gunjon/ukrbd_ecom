
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/sub_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/custom_app_bar.dart';
import 'package:ecom_ukrbd/view/basewidget/no_internet_screen.dart';
import 'package:ecom_ukrbd/view/basewidget/product_shimmer.dart';
import 'package:ecom_ukrbd/view/basewidget/product_widget_ukrbd.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class BrandAndCategoryProductScreenUkrbd extends StatefulWidget {
  static const String routeName = "/brandAndCategoryProductScreenUkrbd";
  final bool isBrand;
  final bool isHome;
  final bool isSubcategory;
  final String id;
  final String name;
  final String image;
  final List<Products> productsList;
  BrandAndCategoryProductScreenUkrbd(
      {@required this.isBrand,
      @required this.id,
      @required this.name,
        @required this.isHome,
        this.productsList,
      this.image,
      this.isSubcategory}
      );

  @override
  State<BrandAndCategoryProductScreenUkrbd> createState() =>
      _BrandAndCategoryProductScreenUkrbdState();
}

class _BrandAndCategoryProductScreenUkrbdState extends State<BrandAndCategoryProductScreenUkrbd> {


  _load(BuildContext context, bool reload) async {
    print(widget.id);
    widget.isSubcategory
        ? await Provider.of<SubCategoryWiseProductProviderUkrbd>(context, listen: false).getSubCategoryWiseProductList(reload, context, widget.id)
        : await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductList(reload, context, widget.id);
  }
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load(context, true);
    }

    );

    // TODO: implement initState
    super.initState();
  }


//CategoryWiseProductProviderUkrbd

  @override
  Widget build(BuildContext context) {
    //Provider.of<ProductProvider>(context, listen: false).initBrandOrCategoryProductList(isBrand, id, context);
    return !widget.isSubcategory
        ? WillPopScope(
            onWillPop: () {
              if(!widget.isHome){
                // Provider.of<CategoryWiseProductProviderUkrbd>(context,
                //     listen: false)
                //     .clear();
                Navigator.of(context).pop();
              }else{
                Navigator.of(context).pop();
              }
            },
            child: Consumer<BottomNavigationBarProvider>(
              builder: (context,bottomNavigationBarProvider,child){
                return Scaffold(
                  bottomNavigationBar:
                  bottomNavigationBarProvider.bottomNavigationBar(context, false),

                  backgroundColor: ColorResources.getHomeBg(context),
                  resizeToAvoidBottomInset: false,

                  // backgroundColor: ColorResources.getIconBg(context),
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Consumer<CategoryWiseProductProviderUkrbd>(builder:
                            (context, categoryWiseProductProviderUkrbd, child) {
                          return CustomAppBar(
                            title: widget.name,
                            onBackPressed: () {
                              if(!widget.isHome){
                                categoryWiseProductProviderUkrbd.clear();
                                Navigator.of(context).pop();
                              }else{
                                Navigator.of(context).pop();
                              }
                            },
                          );
                        }),


                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        // Products
                        // productProvider.brandOrCategoryProductList.length > 0 ? Expanded(
                        Consumer<CategoryWiseProductProviderUkrbd>(builder:
                            (context, categoryWiseProductProviderUkrbd, child) {
                          print(
                              "product list :::::::::::::::");

                          List<Products> categoryWiseProductsList=widget.isHome?widget.productsList:categoryWiseProductProviderUkrbd.categoryWiseProductList;
                          return categoryWiseProductsList.length > 0
                              ? Expanded(
                            child: StaggeredGridView.countBuilder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.PADDING_SIZE_SMALL,
                              ),
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 2,
                              itemCount: (categoryWiseProductsList.length) ,
                              //   itemCount: (categoryWiseProductsList.length) -1,

                              shrinkWrap: true,
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.fit(1),
                              itemBuilder: (BuildContext context, int index) {
                                //   print("print product");


                                return
                                  ProductWidgetUkrbd(
                                      productModel: categoryWiseProductsList[index]);
                                // return null;
                              },
                            ),
                          )
                              :

                          // Expanded(child: Center(child: productProvider.hasData ?
                          Expanded(
                              child: Center(
                                child: categoryWiseProductProviderUkrbd.isloading
                                    ? ProductShimmer(isHomePage: false, isEnabled: categoryWiseProductProviderUkrbd.isloading)
                                    : categoryWiseProductsList.length == 0?NoInternetOrDataScreen(isNoInternet: false):Text(""),
                              )
                          );
                        }),
                      ]),
                );
              },
            ),
          )
        : WillPopScope(
            onWillPop: () {
              if(!widget.isHome){
                Provider.of<SubCategoryWiseProductProviderUkrbd>(context,
                    listen: false)
                    .clear();
                Navigator.of(context).pop();
              }else{
                Navigator.of(context).pop();
              }
            },
            child: Consumer<BottomNavigationBarProvider>(
              builder: (context,bottomNavigationBarProvider,child){
                return Scaffold(
                  bottomNavigationBar:
                  bottomNavigationBarProvider.bottomNavigationBar(context, false),

                  // backgroundColor: ColorResources.getHomeBg(context),
                  resizeToAvoidBottomInset: false,
                  backgroundColor: ColorResources.getIconBg(context),
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // CustomAppBar(title: widget.name,onBackPressed: (){
                        //
                        // },),
                        Consumer<SubCategoryWiseProductProviderUkrbd>(builder:
                            (context, subCategoryWiseProductProviderUkrbd, child) {
                          return CustomAppBar(
                            title: widget.name,
                            onBackPressed: () {
                              if(!widget.isHome){
                                subCategoryWiseProductProviderUkrbd.clear();
                                Navigator.of(context).pop();
                              }else{
                                Navigator.of(context).pop();
                              }
                            },
                          );
                        }),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        // Products
                        // productProvider.brandOrCategoryProductList.length > 0 ? Expanded(
                        Consumer<SubCategoryWiseProductProviderUkrbd>(builder:
                            (context, subCategoryWiseProductProviderUkrbd, child) {
                          print(
                              "product list :::::::::::::::${subCategoryWiseProductProviderUkrbd.subCategoryWiseProductList.length}");
                          return !subCategoryWiseProductProviderUkrbd.isLoading
                              ? subCategoryWiseProductProviderUkrbd.subCategoryWiseProductList.length != 0?Expanded(
                            child: StaggeredGridView.countBuilder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.PADDING_SIZE_SMALL),
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 2,
                              itemCount: subCategoryWiseProductProviderUkrbd
                                  .subCategoryWiseProductList.length,
                              shrinkWrap: true,
                              staggeredTileBuilder: (int index) =>
                                  StaggeredTile.fit(1),
                              itemBuilder: (BuildContext context, int index) {
                                print("print product");
                                return ProductWidgetUkrbd(
                                    productModel: subCategoryWiseProductProviderUkrbd.subCategoryWiseProductList[index]);
                                // return null;
                              },
                            ),
                          ):Expanded(child: NoInternetOrDataScreen(isNoInternet: false),)
                              :

                          // Expanded(child: Center(child: productProvider.hasData ?
                          Expanded(
                              child: Center(
                                child: subCategoryWiseProductProviderUkrbd.subCategoryWiseProductList.length == 0
                                    ? ProductShimmer(
                                    isHomePage: false,
                                    isEnabled:true,
                                )
                                    : NoInternetOrDataScreen(isNoInternet: false),
                              )
                          );
                        }),
                      ]),
                );
              },
            ),
          );
  }
}
