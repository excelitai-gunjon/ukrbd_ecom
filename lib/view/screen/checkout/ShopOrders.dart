import 'package:flutter/material.dart';
// import 'C:\/Users/ASUS/OneDrive/Desktop/client/User app/lib/view/screen/checkout/dimentions.dart';
import 'package:ecom_ukrbd/view/screen/checkout/dimentions.dart';

class ShopOrders extends StatelessWidget {
  const ShopOrders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // shop title
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimension.padding(figPadding: 15, context: context),
                  right: AppDimension.padding(figPadding: 15, context: context),
                  top: AppDimension.padding(figPadding: 0, context: context),
                  bottom: AppDimension.padding(figPadding: 0, context: context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gold Galore',
                            style: TextStyle(
                                fontSize: AppDimension.padding(figPadding: 14, context: context),
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
        // divider
        Padding(
          padding: EdgeInsets.only(left: AppDimension.padding(figPadding: 15, context: context),
            right: AppDimension.padding(figPadding: 15, context: context),
            ),
          child: Divider(
              color: Colors.black38,

          ),
        ),
        // items
        Padding(
          padding: EdgeInsets.only(left: AppDimension.padding(figPadding: 14, context: context),
            right: AppDimension.padding(figPadding: 14, context: context),
            top: AppDimension.padding(figPadding: 5, context: context),
            bottom: AppDimension.padding(figPadding: 20, context: context),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // amount
              Text("1x",
              style: TextStyle(
                fontSize: AppDimension.padding(figPadding: 18, context: context)
              ),),
              // title
              Container(
                width: AppDimension.padding(figPadding: 150, context: context),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '6 butterflu stone diamond nosepin gg hshb- wight 56',
                        style: TextStyle(
                            fontSize: AppDimension.padding(figPadding: 10, context: context),
                            fontWeight: FontWeight.normal,
                            color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ),
              //price
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ 188727',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 10, context: context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
