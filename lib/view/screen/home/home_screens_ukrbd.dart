import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/banner_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/flash_deal_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_text_button.dart';
import 'package:ecom_ukrbd/view/screen/category/all_category_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/announcement.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/banners_view_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_view_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/home_page_category_wise_product_view_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/latest_product_view.dart';
import 'package:ecom_ukrbd/view/screen/product/view_all_product_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/search/search_screen.dart';
import 'package:provider/provider.dart';


class HomePageUkrbd extends StatefulWidget {


  @override
  State<HomePageUkrbd> createState() => _HomePageUkrbdState();
}

class _HomePageUkrbdState extends State<HomePageUkrbd> {





  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload)async{

    await Provider.of<BannerProviderUkrbd>(context, listen: false).getBannerList(reload, context);

    await Provider.of<CategoryProviderUkrbd>(context, listen: false).getCategoryList(reload, context);
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "82");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "81");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "66");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "65");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "63");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "58");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "56");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "52");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "59");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "74");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "79");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "75");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "78");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "80");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "76");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "55");
    await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, "71");

    print("......................... load home page data .........................");
    print("......................... load home page data .........................");
    print("......................... load home page data .........................");
    print("......................... load home page data .........................");
    print("......................... load home page data .........................");
    print("......................... load home page data .........................");
    print("......................... load home page data .........................");
    print("......................... load home page data .........................");

  }

  void passData(int index, String title) {
    index = index;
    title = title;
  }

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();

    // singleVendor = Provider.of<SplashProvider>(context, listen: false).configModel.businessMode == "single";
    // Provider.of<FlashDealProvider>(context, listen: false).getMegaDealList(true, context, true);

    _loadData(context, false);

    // if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
    //   Provider.of<CartProvider>(context, listen: false).uploadToServer(context);
    //   Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    // }else {
    //   Provider.of<CartProvider>(context, listen: false).getCartData();
    // }
  }


  @override
  Widget build(BuildContext context) {


    List<String> types =[getTranslated('new_arrival', context),getTranslated('top_product', context), getTranslated('best_selling', context),  getTranslated('discounted_product', context)];
    return Scaffold(
      // backgroundColor: ColorResources.getHomeBg(context),
      backgroundColor: Colors.grey.shade50,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            await _loadData(context, true);
            // await Provider.of<FlashDealProvider>(context, listen: false).getMegaDealList(true, context, false);
            return true;
          },
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverDelegate(
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
                        child: Container(padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.HOME_PAGE_PADDING, vertical: Dimensions.PADDING_SIZE_SMALL),
                          color: ColorResources.getHomeBg(context),
                          alignment: Alignment.center,
                          child: Container(padding: EdgeInsets.only(
                            left: Dimensions.HOME_PAGE_PADDING, right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            top: Dimensions.PADDING_SIZE_EXTRA_SMALL, bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                            height: 60, alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(color: Theme.of(context).cardColor,
                              boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                              900 : 200], spreadRadius: 1, blurRadius: 1)],
                              // border: Border.all(color: Color(0xff242424)),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),),
                            child: Row(mainAxisAlignment : MainAxisAlignment.start, children: [

                              // Container(
                              //   width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                              //     borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
                              // ),
                              //   child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
                              // ),
                              // Icon(Icons.search, color: Theme.of(context).primaryColor, size: Dimensions.ICON_SIZE_LARGE),
                              // Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_LARGE),
                              Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_DEFAULT),
                              Text(getTranslated('SEARCH_HINT', context),
                                style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                              ),

                              // Container(
                              //   width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                              //     borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
                              // ),
                              //   child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
                              // ),

                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //  child:Column(
                  //   children: [
                  //     BannersViewUkrbd(),
                  //   ],
                  // )
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(Dimensions.HOME_PAGE_PADDING,
                          Dimensions.PADDING_SIZE_SMALL, Dimensions.PADDING_SIZE_DEFAULT, Dimensions.PADDING_SIZE_SMALL  ),


                      //  child:Column(
                      //   children: [
                      //     BannersViewUkrbd(),
                      //   ],
                      // )

///
                      child:      Column(
                        children: [
                          BannersViewUkrbd(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                             child: Text(getTranslated('CATEGORY', context), style: titleHeader),
                              // TitleRow(title: getTranslated('CATEGORY', context),
                              //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreen()))),
                            ),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                            child: CategoryViewUkrbd(isHomePage: true),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTextButton(title: getTranslated('CATEGORY', context,),
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreenUkrbd()))),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.mensFashionList,id: "76",title: "Men's Fashion",);
                            },
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "80",title: "Ladies Fashion",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.ladiesFashionList,id: "80",title: "Ladies Fashion",);
                            },
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "55",title: "Computer & IT",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.computerAndItList,id: "55",title: "Computer & IT",);
                            },
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "71",title: "Mobile",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.mobileList,id: "71",title: "Mobile",);
                            },
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "78",title: "Fragrances",),
                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.fragrancesListList,id: "78",title: "Fragrances",);
                            },
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "75",title: "Networking",),
                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.networkingList,id: "75",title: "Networking",);
                            },
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "79",title: "kids Fashion",),
                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.kidsFashionList,id: "79",title: "kids Fashion",);
                            },
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "74",title: "Health & Herbs",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.healthAndHerdsList,id: "74",title: "Health & Herbs",);
                            },
                          ),


                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "52",title: "Stationery & Office",),
                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.stationaryAndOfficeList,id: "52",title: "Stationery & Office",);
                            },
                          ),



                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "56",title: "Electrical & Lighting",),

                          // Consumer<CategoryWiseProductProviderUkrbd>(
                          //   builder: (context,categoryWiseProductProviderUkrbd,child){
                          //     return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.electricalAndLightingList,id: "56",title: "Electrical & Lighting",);
                          //   },
                          // ),


                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "58",title: "Electronics & Appliances",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.electronicsAndAppliancesList,id: "58",title: "Electronics & Appliances",);
                            },
                          ),


                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "63",title: "Robotics and Artificial Intelligence",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.roboticsAndArtificialIntelligenceList,id: "63",title: "Robotics and Artificial Intelligence",);
                            },
                          ),


                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "65",title: "Lab Equipment",),
                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.labEquipmentList,id: "65",title: "Lab Equipment",);
                            },
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          // CategoryWiseProductViewWidget(id: "66",title: "Furniture",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.furnitureList,id: "66",title: "Furniture",);
                            },
                          ),


                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                          //
                          // // CategoryWiseProductViewWidget(id: "69",title: "Software Service & Solution",),
                          // Consumer<CategoryWiseProductProviderUkrbd>(
                          //   builder: (context,categoryWiseProductProviderUkrbd,child){
                          //     return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.softwareServiceAndSolutionList,id: "69",title: "Software Service & Solution",);
                          //   },
                          // ),
                          //
                          //
                          //
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                          //
                          // // CategoryWiseProductViewWidget(id: "81",title: "Comforter",),
                          //
                          // Consumer<CategoryWiseProductProviderUkrbd>(
                          //   builder: (context,categoryWiseProductProviderUkrbd,child){
                          //     return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.comforterList,id: "81",title: "Comforter",);
                          //   },
                          // ),


                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),



///
                          // CategoryWiseProductViewWidget(id: "82",title: "Winter Collection",),

                          Consumer<CategoryWiseProductProviderUkrbd>(
                            builder: (context,categoryWiseProductProviderUkrbd,child){
                              return CategoryWiseProductViewWidget(categoryWiseProductList: categoryWiseProductProviderUkrbd.winterCollectionList,id: "82",title: "Winter Collection",);
                            },
                          ),


                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width/4.1,
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder, fit: BoxFit.cover,
                                    image: 'http://ukrbd.com/images/website/banner3.jpg',
                                    imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                          ),



                          // Latest Products
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: TitleRow(title: getTranslated('latest_products', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.LATEST_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('mobile_products', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('computer_&_it', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('fragrances', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('networking', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('ladies_fashion', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('featured_deals', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('health_&_herbs', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('kids_fashion', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('car_&_vehicles', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('stationery_&_office', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('electrical_&_lighting', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('electronics_&_appliances', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('robotics_and_artificial_intelligence', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('software_service_&_solution', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: CustomTitleRow(title: getTranslated('winter_collection', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.MOBILE_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Hide category wise product view
                          // //Home category
                          // // HomeCategoryProductView(isHomePage: true),
                          // SizedBox(height: Dimensions.HOME_PAGE_PADDING),
                          //
                          // // //footer banner
                          // // Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                          // //   return footerBannerProvider.footerBannerList != null && footerBannerProvider.footerBannerList.length>1?
                          // //   FooterBannersView(index: 1):SizedBox();
                          // // }),
                          // SizedBox(height: Dimensions.HOME_PAGE_PADDING),


                          //Category filter
                          // Consumer<ProductProvider>(
                          //     builder: (ctx,prodProvider,child) {
                          //   return Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //     child: Row(children: [
                          //       Expanded(child: Text(prodProvider.title == 'xyz' ? getTranslated('new_arrival',context):prodProvider.title, style: titleHeader)),
                          //       prodProvider.latestProductList != null ? PopupMenuButton(
                          //         itemBuilder: (context) {
                          //           return [
                          //             PopupMenuItem(value: ProductType.NEW_ARRIVAL, child: Text(getTranslated('new_arrival',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //                )),
                          //             PopupMenuItem(value: ProductType.TOP_PRODUCT, child: Text(getTranslated('top_product',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //               )),
                          //             PopupMenuItem(value: ProductType.BEST_SELLING, child: Text(getTranslated('best_selling',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //              )),
                          //             PopupMenuItem(value: ProductType.DISCOUNTED_PRODUCT, child: Text(getTranslated('discounted_product',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //             )),
                          //           ];
                          //         },
                          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                          //         child: Padding(
                          //           padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL,vertical:Dimensions.PADDING_SIZE_SMALL ),
                          //           child: Image.asset(Images.dropdown, scale: 3,),
                          //         ),
                          //         onSelected: (value) {
                          //           if(value == ProductType.NEW_ARRIVAL){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[0]);
                          //           }else if(value == ProductType.TOP_PRODUCT){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[1]);
                          //           }else if(value == ProductType.BEST_SELLING){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[2]);
                          //           }else if(value == ProductType.DISCOUNTED_PRODUCT){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[3]);
                          //           }
                          //
                          //           ProductView(isHomePage: false, productType: value, scrollController: _scrollController);
                          //           Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, context, reload: true);
                          //
                          //
                          //         }
                          //       ) : SizedBox(),
                          //     ]),
                          //   );
                          // }),
                          // ProductView(isHomePage: false, productType: ProductType.NEW_ARRIVAL, scrollController: _scrollController),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                        ],
                      ),
                    ),
                  )



                ],
              ),

              Provider.of<SplashProvider>(context, listen: false).configModel.announcement.status == '1'?
              Positioned(top: MediaQuery.of(context).size.height-128,
                left: 0,right: 0,
                child: Consumer<SplashProvider>(
                  builder: (context, announcement, _){
                    return (announcement.configModel.announcement.announcement != null && announcement.onOff)?
                    AnnouncementScreen(announcement: announcement.configModel.announcement):SizedBox();
                  },

                ),
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 || oldDelegate.minExtent != 70 || child != oldDelegate.child;
  }
}
