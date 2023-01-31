import 'package:ecom_ukrbd/provider/all_category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/banner_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_text_button.dart';
import 'package:ecom_ukrbd/view/screen/category/all_category_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/banners_view_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_view_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/home_page_category_wise_product_view_widget_ukrbd.dart';
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
    await Provider.of<AllCategoryWiseProductProviderUkrbd>(context, listen: false).getAllCategoryWiseProductList(context);

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

    _loadData(context, false);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;


    List<String> types =[getTranslated('new_arrival', context),getTranslated('top_product', context), getTranslated('best_selling', context),  getTranslated('discounted_product', context)];
    return Consumer<AllCategoryWiseProductProviderUkrbd>(
      builder: (context,allCategoryWiseProductProviderUkrbd,child){
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
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    slivers: [

                      SliverAppBar(
                        floating: true,
                        elevation: 0,
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Theme.of(context).highlightColor,

                        title: Padding(
                          padding:  EdgeInsets.only(top: size.width*(8/360)),
                          child: Image.asset(Images.logo_with_name_image, height: size.width*(45/360),width: size.width*(200/360),fit: BoxFit.contain,),
                        ),
                        actions: [


                        ],
                      ),

                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SliverDelegate(
                          child: InkWell(
                            onTap: () {
                              if(Provider.of<AllCategoryWiseProductProviderUkrbd>(context,listen: false).allCategoryWiseProductList.length>0){
                                // return Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()));
                                showSearch(
                                    context: context,
                                    delegate: DataSearch(
                                        products: Provider.of<AllCategoryWiseProductProviderUkrbd>(context,listen: false).allCategoryWiseProductList,
                                        recentSearches: []));
                              }
                            },
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

                                  Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_DEFAULT),
                                  Text(getTranslated('SEARCH_HINT', context),
                                    style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                                  ),

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
                          child: Column(
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
                                padding: EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                child: CategoryViewUkrbd(isHomePage: true),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: CustomTextButton(title: getTranslated('CATEGORY', context,),
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreenUkrbd()))),
                              ),

                              SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                              Padding(
                                padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width/3,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/banner/banner3.jpeg", fit: BoxFit.cover,
                                        image: 'http://ukrbd.com/images/website/banner3.jpg',
                                        height: 200,
                                        width: size.width,
                                        imageErrorBuilder: (c, o, s) => Image.asset("assets/banner/banner3.jpeg", fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                              // CategoryWiseProductViewWidget(id: "52",title: "Stationery & Office",),
                              allCategoryWiseProductProviderUkrbd.stationaryAndOfficeList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.stationaryAndOfficeList,id: "52",title: "Stationery & Office",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),
                              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                              // CategoryWiseProductViewWidget(id: "55",title: "Computer & IT",),

                              allCategoryWiseProductProviderUkrbd.computerAndItList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.computerAndItList,id: "55",title: "Computer & IT",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),
                              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                              // CategoryWiseProductViewWidget(id: "55",title: "Computer & IT",),

                              allCategoryWiseProductProviderUkrbd.electricalAndLightingList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.electricalAndLightingList,id: "56",title: "Electrical & Lighting",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),
                              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                              allCategoryWiseProductProviderUkrbd.electronicsAndAppliancesList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.electronicsAndAppliancesList,id: "58",title: "Electronics & Appliances",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),


                              allCategoryWiseProductProviderUkrbd.carAndVehiclesList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.carAndVehiclesList,id: "59",title: "Car & Vehicles",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "63",title: "Robotics and Artificial Intelligence",),
                              allCategoryWiseProductProviderUkrbd.roboticsAndArtificialIntelligenceList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.roboticsAndArtificialIntelligenceList,id: "63",title: "Robotics and Artificial Intelligence",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "65",title: "Lab Equipment",),
                              allCategoryWiseProductProviderUkrbd.labEquipmentList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.labEquipmentList,id: "65",title: "Lab Equipment",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "66",title: "Furniture",),
                              allCategoryWiseProductProviderUkrbd.furnitureList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.furnitureList,id: "66",title: "Furniture",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),
                              //
                              // // CategoryWiseProductViewWidget(id: "69",title: "Software Service & Solution",),
                              allCategoryWiseProductProviderUkrbd.softwareServiceAndSolutionList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.softwareServiceAndSolutionList,id: "69",title: "Software Service & Solution",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "71",title: "Mobile",),
                              allCategoryWiseProductProviderUkrbd.mobileList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.mobileList,id: "71",title: "Mobile",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "74",title: "Health & Herbs",),
                              allCategoryWiseProductProviderUkrbd.healthAndHerdsList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.healthAndHerdsList,id: "74",title: "Health & Herbs",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "75",title: "Networking",),
                              allCategoryWiseProductProviderUkrbd.networkingList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.networkingList,id: "75",title: "Networking",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                          allCategoryWiseProductProviderUkrbd.mensFashionList.length>0?
                          CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.mensFashionList,id: "76",title: "Men's Fashion",):SizedBox(
                            height: 90,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                            ),
                          ),

                              // CategoryWiseProductViewWidget(id: "78",title: "Fragrances",),
                              allCategoryWiseProductProviderUkrbd.fragrancesListList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.fragrancesListList,id: "78",title: "Fragrances",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "79",title: "kids Fashion",),
                              allCategoryWiseProductProviderUkrbd.kidsFashionList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.kidsFashionList,id: "79",title: "kids Fashion",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "80",title: "Ladies Fashion",),
                              allCategoryWiseProductProviderUkrbd.ladiesFashionList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.ladiesFashionList,id: "80",title: "Ladies Fashion",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "82",title: "Winter Collection",), m
                              allCategoryWiseProductProviderUkrbd.winterCollectionList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.winterCollectionList,id: "82",title: "Winter Collection",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "82",title: "Grocery & Beauty",), m
                              allCategoryWiseProductProviderUkrbd.groceryAndBeautyList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.groceryAndBeautyList,id: "83",title: "Grocery & Beauty",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "84",title: "Girls Fashion",),
                              allCategoryWiseProductProviderUkrbd.girlsFashionList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.girlsFashionList,id: "83",title: "Girls Fashion",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "85",title: "Health & Beauty",),
                              allCategoryWiseProductProviderUkrbd.healthAndBeautyList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.healthAndBeautyList,id: "85",title: "Health & Beauty",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),

                              // CategoryWiseProductViewWidget(id: "86",title: "Vegetables",),
                              allCategoryWiseProductProviderUkrbd.vegetablesList.length>0?
                              CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.vegetablesList,id: "86",title: "Vegetables",):SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                                ),
                              ),


                              // SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
                              //
                              // // CategoryWiseProductViewWidget(id: "81",title: "Comforter",),
                              // allCategoryWiseProductProviderUkrbd.comforterList.length>0?
                              // CategoryWiseProductViewWidget(categoryWiseProductList: allCategoryWiseProductProviderUkrbd.comforterList,id: "81",title: "Comforter",):SizedBox(
                              //   height: 90,
                              //   width: double.infinity,
                              //   child: Center(
                              //     child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
                              //   ),
                              // ),


                              SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

                              Padding(
                                padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width/3,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: "assets/banner/banner3.jpeg", fit: BoxFit.cover,
                                        image: 'http://ukrbd.com/images/website/banner3.jpg',
                                        height: 200,
                                        width: size.width,
                                        imageErrorBuilder: (c, o, s) => Image.asset("assets/banner/banner3.jpeg", fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                ),
                              ),



                              SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                            ],
                          ),
                        ),
                      )



                    ],
                  ),

                  // Provider.of<SplashProvider>(context, listen: false).configModel.announcement.status == '1'?
                  // Positioned(top: MediaQuery.of(context).size.height-128,
                  //   left: 0,right: 0,
                  //   child: Consumer<SplashProvider>(
                  //     builder: (context, announcement, _){
                  //       return (announcement.configModel.announcement.announcement != null && announcement.onOff)?
                  //       AnnouncementScreen(announcement: announcement.configModel.announcement):SizedBox();
                  //     },
                  //
                  //   ),
                  // ):SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
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
