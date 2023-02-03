
import 'dart:math';
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_widget_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/category.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AllCategoryScreenUkrbd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Consumer<BottomNavigationBarProvider>(
      builder: (context,bottomNavigationBarProvider,child){
        return Scaffold(
          backgroundColor: ColorResources.getIconBg(context),

          bottomNavigationBar:
          bottomNavigationBarProvider.bottomNavigationBar(context, false),

          // backgroundColor: ColorResources.getHomeBg(context),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0.2,
            foregroundColor: Colors.black,
            backgroundColor: Theme.of(context).highlightColor,
            title: Text(getTranslated('CATEGORY', context),
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [

                SizedBox(height: 10,),

                Expanded(child: Consumer<CategoryProviderUkrbd>(
                  builder: (context, categoryProvider, child) {
                    return categoryProvider.categoryList.length != 0 ? Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: (2/1.2),
                        ),
                        itemCount: categoryProvider.categoryList.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {

                          return InkWell(
                            onTap: () {

                              Provider.of<CategoryProviderUkrbd>(context, listen: false).changeSelectedIndex(index);
                              Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreenUkrbd()));

                            },
                            child: CategorySubcategoryWidgetUkrbd(category: categoryProvider.categoryList[index],categoryCardImage: getRandomElement(CategoryImageModel.categoryImageList),colorCode: getRandomElement(CategoryCardColorModel.categoryCardColorList),isHome: false,),
                          );

                        },
                      ),
                    ): Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
                  },
                )),
                SizedBox(height: 10,),
              ],
            ),
          ),
        );
      },

    );
  }

  List<Widget> _getSubSubCategories(BuildContext context, SubCategory subCategory) {
    List<Widget> _subSubCategories = [];
    _subSubCategories.add(Container(
      color: ColorResources.getIconBg(context),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: ListTile(
        title: Row(
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(color: ColorResources.getPrimary(context), shape: BoxShape.circle),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Flexible(child: Text(getTranslated('all', context), style: titilliumSemiBold.copyWith(
                color: Theme.of(context).textTheme.bodyText1.color), maxLines: 2, overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
            isBrand: false,
            id: subCategory.id.toString(),
            name: subCategory.name,
          )));
        },
      ),
    ));
    for(int index=0; index < subCategory.subSubCategories.length; index++) {
      _subSubCategories.add(Container(
        color: ColorResources.getIconBg(context),
        margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(color: ColorResources.getPrimary(context), shape: BoxShape.circle),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Flexible(child: Text(subCategory.subSubCategories[index].name, style: titilliumSemiBold.copyWith(
                  color: Theme.of(context).textTheme.bodyText1.color), maxLines: 2, overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
              isBrand: false,
              id: subCategory.subSubCategories[index].id.toString(),
              name: subCategory.subSubCategories[index].name,
            )));
          },
        ),
      ));
    }
    return _subSubCategories;
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  CategoryItem({@required this.title, @required this.icon, @required this.isSelected});

  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      width: MediaQuery.of(context).size.width,
      height: 130,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(10),
        color: isSelected ?ColorResources.getIconBg(context) : null,//ColorResources.getPrimary(context) : null,
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: isSelected ? Theme.of(context).highlightColor : Theme.of(context).hintColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder, fit: BoxFit.cover,
                image: '$icon',
                imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: titilliumSemiBold.copyWith(
              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
              color: isSelected ? Provider.of<ThemeProvider>(context).darkTheme?Colors.white:Theme.of(context).hintColor : Theme.of(context).hintColor,
            )),
          ),
        ]),
      ),
    );
  }
}

T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}

class CategoryImageModel{

  static List<String> categoryImageList=[
    "assets/category/3.png",
    "assets/category/4.png",
    "assets/category/6.png",
    "assets/category/7.png",
    "assets/category/8.png",
    "assets/category/10.png",
    "assets/category/11.png",
    "assets/category/4.png",
    "assets/category/6.png",
  ];

}

class CategoryCardColorModel{

  static List<int> categoryCardColorList=[
    // 0xffEDEFEA,
    // 0xffF0E2D9,
    // 0xffFFE8CC,
    // 0xffF4EAF3,
    // 0xffD5E5DA,
    // 0xffF4DCDC,
    // 0xffEDEFEA,
    // 0xffF0E2D9,
    0xff8EA7E9,
    0xffD9ACF5,
    0xffFF9F9F,
    0xff90A17D,
    0xff7D6E83,
    0xff7D9D9C,
    0xffAC7D88,
    0xffAF7AB3,
  ];

}

class CategoryShimmerNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: (2/1.0),
      ),
      itemCount: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {

        return Column( children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.width/5,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
                // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                borderRadius: BorderRadius.circular(2),
                // color: Theme.of(context).highlightColor,
                color: Colors.transparent,
              ),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child:
                // FadeInImage.assetNetwork(
                //   fit: BoxFit.cover,
                //   placeholder: Images.placeholder,
                //   image: category.image!=null?'${Provider.of<SplashProvider>(context,listen: false).baseUrls.categoryImageUrl}'
                //       '/${category.image}':null,
                //   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover,),
                // ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        enabled: Provider.of<CategoryProviderUkrbd>(context).categoryList.length == 0,
                        child: Container(decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: MediaQuery.of(context).size.width*.4,
                        width: MediaQuery.of(context).size.width*.18,
                        // color: Colors.deepOrangeAccent,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          enabled: Provider.of<CategoryProviderUkrbd>(context).categoryList.length == 0,
                          child: Container(decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          // Container(
          //   child: Center(
          //     child: Text(widget.category.category,
          //       textAlign: TextAlign.center,
          //       maxLines: 1,
          //       overflow: TextOverflow.ellipsis,
          //       style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
          //           color: ColorResources.getTextTitle(context)),
          //     ),
          //   ),
          // ),

        ]);
        //   Container(
        //   decoration: BoxDecoration(boxShadow: [BoxShadow(
        //       color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200],
        //       spreadRadius: 2, blurRadius: 5)]),
        //   margin: EdgeInsets.all(3),
        //   child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //
        //     Expanded(
        //       flex: 7,
        //       child: Shimmer.fromColors(
        //         baseColor: Colors.grey[300],
        //         highlightColor: Colors.grey[100],
        //         enabled: Provider.of<CategoryProviderUkrbd>(context).categoryList.length == 0,
        //         child: Container(decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        //         )),
        //       ),
        //     ),
        //
        //     Expanded(flex: 3, child: Container(
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: ColorResources.getTextBg(context),
        //         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        //       ),
        //       child: Shimmer.fromColors(
        //         baseColor: Colors.grey[300],
        //         highlightColor: Colors.grey[100],
        //         enabled: Provider.of<CategoryProviderUkrbd>(context).categoryList.length == 0,
        //         child: Container(height: 10, color: Colors.white, margin: EdgeInsets.only(left: 15, right: 15)),
        //       ),
        //     )),
        //
        //   ]),
        // );

      },
    );
  }
}
