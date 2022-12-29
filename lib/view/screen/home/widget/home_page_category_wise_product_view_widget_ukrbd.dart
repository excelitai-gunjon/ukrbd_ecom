

import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/category_wise_product_provider_ukrbd.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/custom_title_row.dart';
import 'package:ecom_ukrbd/view/basewidget/product_shimmer.dart';
import 'package:ecom_ukrbd/view/basewidget/product_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:provider/provider.dart';

class CategoryWiseProductViewWidget extends StatefulWidget {
  String id;
  String title;
  bool reload;
  CategoryWiseProductViewWidget({Key key,this.id,this.title,this.reload}) : super(key: key);

  @override
  State<CategoryWiseProductViewWidget> createState() => _CategoryWiseProductViewWidgetState();
}

class _CategoryWiseProductViewWidgetState extends State<CategoryWiseProductViewWidget> {

  List<Data> categoryWiseProductList=[];

  @override
  void initState() {
   // _load(widget.reload,context);
    // TODO: implement initState
    super.initState();
  }

  // _load(bool reload,BuildContext context)async{
  //   //Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).clear();
  //   categoryWiseProductList= await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, widget.id);
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    return Column(
      children: [
        // categoryWiseProductList.length>0 ?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
            child: FutureBuilder(
              future: Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, widget.id),
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                  List<Data> list=snapshot.data;
                  return CustomTitleRow(title: getTranslated(widget.title, context),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
                          isBrand: false,
                          id: widget.id,

                          name: widget.title,
                          isSubcategory: false,
                          isHome: true,
                          productsList: list,
                        )));
                      });
                }else{
                  return SizedBox.shrink();
                }
              }),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
          child: Column(
              children: [
                // categoryWiseProductList.length!=0?
                Container(

               height: MediaQuery.of(context).size.width/1.20,
                  child: FutureBuilder(
                    future: Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(true, context, widget.id),
                    builder: ((context, snapshot) {
                      if(snapshot.hasData){
                        List<Data> list=snapshot.data;

                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: (list.length) ,
                            //itemCount: (list.length) -1,
                            itemBuilder: (ctx,index){
                              return Container(width: (MediaQuery.of(context).size.width/2.06)-10,
                                  child: ProductWidgetUkrbd(productModel: list[index]));
                            }
                        );
                      }else{
                        return ProductShimmer(isHomePage: true ,isEnabled: true);
                      }

                    }
                    ),
                  ),
                ),
              ]
          ),
        ),
      ],
    );
  }
}
