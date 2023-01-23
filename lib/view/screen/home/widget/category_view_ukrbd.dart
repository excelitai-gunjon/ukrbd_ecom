import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/provider/category_provider.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/category/all_category_screen.dart';
import 'package:ecom_ukrbd/view/screen/category/all_category_screen_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_widget.dart';
import 'package:ecom_ukrbd/view/screen/home/widget/category_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'category_shimmer.dart';

class CategoryViewUkrbd extends StatefulWidget {
  final bool isHomePage;
  CategoryViewUkrbd({@required this.isHomePage});

  @override
  State<CategoryViewUkrbd> createState() => _CategoryViewUkrbdState();
}

class _CategoryViewUkrbdState extends State<CategoryViewUkrbd> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProviderUkrbd>(
      builder: (context, categoryProvider, child) {

        return categoryProvider.categoryList.length != 0 ?
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: (2/1.2),
            ),
            itemCount: widget.isHomePage
                ? categoryProvider.categoryList.length > 8
                ? 8
                : categoryProvider.categoryList.length
                : categoryProvider.categoryList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {

              return InkWell(
                onTap: () {

                  Provider.of<CategoryProviderUkrbd>(context, listen: false).changeSelectedIndex(index);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreenUkrbd()));

                },
                child: CategorySubcategoryWidgetUkrbd(category: categoryProvider.categoryList[index],categoryImage: CategoryImageModel.categoryImageList[index],colorCode: CategoryCardColorModel.categoryCardColorList[index],isHome: true,),
              );

            },
          ),
        )

            // : CategoryShimmer();
            : CategoryShimmerNew();

      },
    );
  }
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
    0xffEDEFEA,
    0xffF0E2D9,
    0xffFFE8CC,
    0xffF4EAF3,
    0xffD5E5DA,
    0xffF4DCDC,
    0xffEDEFEA,
    0xffF0E2D9,
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
