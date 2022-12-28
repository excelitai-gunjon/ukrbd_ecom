
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/Subcategories.dart';
import 'package:ecom_ukrbd/data/model/response/categories_ukrbd.dart';
import 'package:ecom_ukrbd/data/model/response/category.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/category_provider.dart';
import 'package:ecom_ukrbd/provider/category_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/provider/theme_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/custom_app_bar.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:provider/provider.dart';

class AllCategoryScreenUkrbd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [

          CustomAppBar(title: getTranslated('CATEGORY', context)),

          Expanded(child: Consumer<CategoryProviderUkrbd>(
            builder: (context, categoryProvider, child) {
              return categoryProvider.categoryList.length != 0 ? Row(children: [

                Container(
                  width: 100,
                  margin: EdgeInsets.only(top: 0),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,//,
                    // boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200],
                    //     spreadRadius: 1, blurRadius: 1)],
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: categoryProvider.categoryList.length,
                    padding: EdgeInsets.only(top: 0.0,left: 0.0,bottom: 0.0),
                    itemBuilder: (context, index) {
                      Categories _category = categoryProvider.categoryList[index];
                      return InkWell(
                        onTap: () => Provider.of<CategoryProviderUkrbd>(context, listen: false).changeSelectedIndex(index),
                        child: CategoryItem(
                          title: _category.category,
                          icon: _category.image,
                          isSelected: categoryProvider.categorySelectedIndex == index,
                        ),
                      );

                    },
                  ),
                ),

                Expanded(child: ListView.builder(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  itemCount: categoryProvider.categoryList[categoryProvider.categorySelectedIndex].subcategories.length+1,
                  itemBuilder: (context, index) {

                    Subcategories _subCategory;
                    if(index != 0) {
                      _subCategory = categoryProvider.categoryList[categoryProvider.categorySelectedIndex].subcategories[index-1];
                    }
                    if(index == 0) {
                      return Ink(
                        decoration: BoxDecoration(
                            color: ColorResources.getIconBg(context),//Theme.of(context).highlightColor,//
                            border: Border(
                              top: BorderSide(color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,),
                              bottom: BorderSide(color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,),
                            )
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(getTranslated('all', context), style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
                              Container(height: MediaQuery.of(context).size.width*.11,width: 1,color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,)
                            ],
                          ),
                          trailing: Icon(Icons.navigate_next),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
                              isBrand: false,
                              id: categoryProvider.categoryList[categoryProvider.categorySelectedIndex].id.toString(),
                              name: categoryProvider.categoryList[categoryProvider.categorySelectedIndex].category,
                              isSubcategory: false,
                              isHome: false,
                            )));
                          },
                        ),
                      );
                    }
                    // else if (_subCategory.subSubCategories.length != 0) {
                    //   return Ink(
                    //     decoration: BoxDecoration(
                    //         color: ColorResources.getIconBg(context),//Theme.of(context).highlightColor,//
                    //         border: Border(
                    //           top: BorderSide(color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,),
                    //           bottom: BorderSide(color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,),
                    //         )
                    //     ),
                    //     child: Theme(
                    //       data: Provider.of<ThemeProvider>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
                    //       child: ExpansionTile(
                    //         key: Key('${Provider.of<CategoryProvider>(context).categorySelectedIndex}$index'),
                    //         // title: Text(_subCategory.name, style: titilliumSemiBold.copyWith(color: Theme.of(context).textTheme.bodyText1.color), maxLines: 2, overflow: TextOverflow.ellipsis),
                    //         title: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(_subCategory.name, style: titilliumSemiBold.copyWith(color: Theme.of(context).textTheme.bodyText1.color), maxLines: 2, overflow: TextOverflow.ellipsis),
                    //             Container(height: MediaQuery.of(context).size.width*.11,width: 1,color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,)
                    //           ],
                    //         ),
                    //         children: _getSubSubCategories(context, _subCategory),
                    //       ),
                    //     ),
                    //   );
                    // }
                    else {
                      return Ink(
                        color: ColorResources.getIconBg(context),//Theme.of(context).highlightColor,//
                        child: ListTile(
                          // title: Text(_subCategory.name, style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_subCategory.subCategory, style: titilliumSemiBold, maxLines: 2, overflow: TextOverflow.ellipsis),
                              Container(height: MediaQuery.of(context).size.width*.11,width: 1,color: Provider.of<ThemeProvider>(context).darkTheme?Theme.of(context).highlightColor:Colors.grey.shade300,)
                            ],
                          ),
                          trailing: Icon(Icons.navigate_next, color: Theme.of(context).textTheme.bodyText1.color),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
                              isBrand: false,
                              id: _subCategory.id.toString(),
                              name: _subCategory.subCategory,
                              isSubcategory: true,
                              isHome: false,
                            )));
                          },
                        ),
                      );
                    }

                  },
                )),

              ]) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
            },
          )),
        ],
      ),
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
          Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
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
            Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
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
                image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.categoryImageUrl}/$icon',
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

