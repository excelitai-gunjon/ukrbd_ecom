

import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/custom_title_row.dart';
import 'package:ecom_ukrbd/view/basewidget/product_shimmer.dart';
import 'package:ecom_ukrbd/view/basewidget/product_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';


class CategoryWiseProductViewWidget extends StatelessWidget {
  List<Products> categoryWiseProductList;
  String title;
  String id;
  bool reload;
  CategoryWiseProductViewWidget({Key key,this.id,this.categoryWiseProductList,this.title,this.reload}) : super(key: key);


  // List<Products> categoryWiseProductList=[];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // categoryWiseProductList.length>0 ?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
            child: categoryWiseProductList.length!=0?CustomTitleRow(title: getTranslated(title, context),
                onTap: () {
              /// All product will show for a particular category
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
                    isBrand: false,
                    id: id,
                    name: title,
                    isSubcategory: false,
                    isHome: true,
                    productsList:categoryWiseProductList,
                  )));
                }):SizedBox.shrink(),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
          child: Container(
            height: MediaQuery.of(context).size.width*.6,
            child: categoryWiseProductList.length>0?ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (categoryWiseProductList.length<8?categoryWiseProductList.length:8) ,
                itemBuilder: (ctx,index){
                  return Container(width: (MediaQuery.of(context).size.width*.4),
                      child: ProductWidgetUkrbd(productModel: categoryWiseProductList[index]));
                }
                ):ProductShimmer(isHomePage: true ,isEnabled: true),
          ),
        ),
      ],
    );
  }
}
