import 'package:ecom_ukrbd/view/screen/product/product_details_screen_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';



class SearchProductWidgetUkrbd extends StatelessWidget {
  final Products productModel;
  SearchProductWidgetUkrbd({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    String ratting =  "5";
    final size= MediaQuery.of(context).size;




    return InkWell(
      onTap: () {
        // Navigator.push(context, PageRouteBuilder(
        //   transitionDuration: Duration(milliseconds: 1000),
        //   pageBuilder: (context, anim1, anim2) => ProductDetailsScreenUkrbd(productId: productModel.id.toString(),),
        // ));
        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetailsScreenUkrbd(productId: productModel.id.toString(),)));

      },
      child:   Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * (15 / 360),
            vertical: size.width * (8 / 360)),
        margin: EdgeInsets.symmetric(
            vertical: size.width * (8 / 360)),
        //height: size.width*(60/360),
        width: size.width,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey.shade300, width: 1))),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(
              width: size.width * (20 / 700),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                width: size.width * (40 / 360),
                height: size.width * (50 / 360),
                fit: BoxFit.cover,
                image: 'https://ukrbd.com/images/products/' +
                    "${productModel.productimages.length>0?productModel.productimages[0].image:""}",
                imageErrorBuilder: (c, o, s) => Image.asset(
                    Images.placeholder,
                    width: size.width * (40 / 360),
                    height: size.width * (50 / 360),
                    fit: BoxFit.cover),
              ),
            ),

            SizedBox(
              width: size.width * (18 / 360),
            ),
            Expanded(
                child: SizedBox(
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                          text: '${productModel.productName}',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.width *
                                  (Dimensions.FONT_SIZE_DEFAULT /
                                      360)),
                        ),
                        TextSpan(
                            text:
                            '\nprice :${productModel.price}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: size.width *
                                    (Dimensions.FONT_SIZE_SMALL /
                                        360))),
                      ],
                    ),
                  ),
                )),

          ],
        ),
      ),


    );
  }
}
