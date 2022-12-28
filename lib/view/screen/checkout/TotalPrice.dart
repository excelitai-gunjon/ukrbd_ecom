import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/view/screen/checkout/dimentions.dart';
// import 'C:\/Users/ASUS/OneDrive/Desktop/client/User app/lib/view/screen/checkout/dimentions.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // divider
        Padding(
          padding: EdgeInsets.only(left: AppDimension.padding(figPadding: 10, context: context),
              right:  AppDimension.padding(figPadding: 10, context: context),
              bottom: 0),
          child: Divider(
            color: Colors.black38,
          ),
        ),
        // subtotal
        Padding(
          padding: EdgeInsets.only(
              left:  AppDimension.padding(figPadding: 15, context: context),
              right:  AppDimension.padding(figPadding: 15, context: context),
              top:  AppDimension.padding(figPadding: 10, context: context),
              bottom:  AppDimension.padding(figPadding: 10, context: context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sub total',
                      style: TextStyle(
                          fontSize:  AppDimension.padding(figPadding: 12, context: context),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ 378287',
                      style: TextStyle(
                          fontSize:  AppDimension.padding(figPadding: 14, context: context),
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // delivery charge
        Padding(
          padding: EdgeInsets.only(
              left:  AppDimension.padding(figPadding: 15, context: context),
              right:  AppDimension.padding(figPadding: 15, context: context),
              top:  AppDimension.padding(figPadding: 10, context: context),
              bottom:  AppDimension.padding(figPadding: 10, context: context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Delivery charge',
                      style: TextStyle(
                          fontSize:  AppDimension.padding(figPadding: 12, context: context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ 236',
                      style: TextStyle(
                          fontSize:  AppDimension.padding(figPadding: 14, context: context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // vat
        Padding(
          padding:EdgeInsets.only(
              left:  AppDimension.padding(figPadding: 15, context: context),
              right:  AppDimension.padding(figPadding: 15, context: context),
              top:  AppDimension.padding(figPadding: 10, context: context),
              bottom:  AppDimension.padding(figPadding: 10, context: context)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'VAT +SD (if applicable)',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 12, context: context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ 0.00',
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
        // discount
        Padding(
          padding: EdgeInsets.only(
              left:  AppDimension.padding(figPadding: 15, context: context),
              right:  AppDimension.padding(figPadding: 15, context: context),
              top:  AppDimension.padding(figPadding: 10, context: context),
              bottom:  AppDimension.padding(figPadding: 10, context: context)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Discount',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 12, context: context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ -9287',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 14, context: context),
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // promo discount
        Padding(
          padding:  EdgeInsets.only(left:  AppDimension.padding(figPadding: 15, context: context),
              right:  AppDimension.padding(figPadding: 15, context: context),
              top:  AppDimension.padding(figPadding: 10, context: context),
              bottom:  AppDimension.padding(figPadding: 10, context: context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Promo Discount',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 12, context: context),
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ 0.00',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 14, context: context),
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // divider
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
          child: Divider(
            color: Colors.black38,
          ),
        ),
        // total
        Padding(
          padding: EdgeInsets.only(
        left:  AppDimension.padding(figPadding: 15, context: context),
    right:  AppDimension.padding(figPadding: 15, context: context),
    top:  AppDimension.padding(figPadding: 10, context: context),
    bottom:  AppDimension.padding(figPadding: 10, context: context)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'TOTAL (incl. VAT)',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 16, context: context),
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '৳ 478287',
                      style: TextStyle(
                          fontSize: AppDimension.padding(figPadding: 16, context: context),
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
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
