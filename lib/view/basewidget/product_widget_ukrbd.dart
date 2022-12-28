import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/rating_bar.dart';
import 'package:ecom_ukrbd/view/screen/product/ProductDetailsScreenUkrbd.dart';

class ProductWidgetUkrbd extends StatelessWidget {
  final Data productModel;
  ProductWidgetUkrbd({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    // String ratting = productModel.rating != null && productModel.rating.length != 0? productModel.rating[0].average : "0";
    String ratting =  "5";
    final size= MediaQuery.of(context).size;
    final double offers =productModel.discount.isNotEmpty?int.tryParse(productModel.discount)/int.tryParse(productModel.salesPrice)*100:0.0;
    final int befor_discount=productModel.discount.isNotEmpty?int.tryParse(productModel.salesPrice)-int.tryParse(productModel.discount):int.tryParse(productModel.salesPrice);


    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (context, anim1, anim2) => ProductDetailsScreenUkrbd(productModel: productModel,),
        ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width/1.5,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
        ),
        child: Stack(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.width/2.3,
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder, fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.width/2.45,
                  // image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
                  image: "https://ukrbd.com/images/products/${productModel.productimages[0].image}",
                  imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
                      fit: BoxFit.contain,height: MediaQuery.of(context).size.width/2.45),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.only(top :Dimensions.PADDING_SIZE_SMALL,bottom: 5, left: 5,right: 5),
              child: Container(

                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(productModel.productName ?? '', textAlign: TextAlign.start,
                          style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.w400), maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar(
                              rating: double.parse(ratting),
                              size: 18,
                            ),


                            // Text('(${productModel.reviewCount.toString() ?? 0})',
                            //     style: robotoRegular.copyWith(
                            //       fontSize: Dimensions.FONT_SIZE_SMALL,
                            //     )),

                            Text('4',
                                style: robotoRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                )),
                          ]),



                      // Text(PriceConverter.convertPrice(context,
                      //     // int.tryParse(productModel.price).toDouble(), discountType: productModel.discountType,
                      //     int.tryParse(productModel.price??"0.0").toDouble(), discountType: "percentage",
                      //     discount: int.tryParse(productModel.discount??"0.0").toDouble()),
                      //   style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                      // ),

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "৳${productModel.salesPrice??0.0}",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width*(15/360),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: ' ৳${befor_discount}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                            fontSize: MediaQuery.of(context).size.width*(10/360),
                          ),
                        ),
                      ],
                    ),
                  ),




                    ],
                  ),
                ),
              ),
            ),
          ]),

          // Off

          int.tryParse(productModel.discount) > 0 ?
          Positioned(top: 0, left: 0, child: Container(
            height: 20,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              color: ColorResources.getPrimary(context),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),


            // child: Center(
            //   child: Text(PriceConverter.percentageCalculation(context, int.tryParse(productModel.discount??"0.0").toDouble(),
            //       // int.tryParse(productModel.offerPrice).toDouble(), productModel.discountType),
            //       int.tryParse(productModel.offerPrice??"0.0").toDouble(), "percentage"),
            //     style: robotoRegular.copyWith(color: Theme.of(context).highlightColor,
            //         fontSize: Dimensions.FONT_SIZE_SMALL),
            //   ),
            // ),
              child: Center(
                child: Text(
                          "${offers.toStringAsFixed(2)}% off",
                  style: robotoRegular.copyWith(color: Theme.of(context).highlightColor,
                      fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              )
          ),
          ) : SizedBox.shrink(),

        ]),
      ),
    );
  }
}
