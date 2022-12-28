
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/view/screen/checkout/ShopOrders.dart';
import 'package:ecom_ukrbd/view/screen/checkout/TotalPrice.dart';
import 'package:ecom_ukrbd/view/screen/checkout/dimentions.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          children: [

            // Component = delivery details
            // 1st row components

            SizedBox(
              height: AppDimension.width(figmaWidth: 10, context: context),//10
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimension.padding(figPadding: 15, context: context),
                  right: AppDimension.padding(figPadding: 15, context: context),
                  top: AppDimension.padding(figPadding: 10, context: context),
                  bottom: AppDimension.padding(figPadding: 10, context: context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'DELIVERY ADDRESS',
                          style: TextStyle(
                              fontSize: AppDimension.width(figmaWidth: 10, context: context),
                              fontWeight: FontWeight.normal,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Edit Address',
                          style: TextStyle(
                              fontSize: AppDimension.width(figmaWidth: 14, context: context),
                              fontWeight: FontWeight.normal,
                              color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimension.height(figmaHeight: 2, context: context),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimension.padding(figPadding: 8, context: context),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(AppDimension.padding(figPadding: 2, context: context)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: AppDimension.padding(figPadding: 2, context: context), color: Colors.black12),
                    ),
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.redAccent,
                      size: AppDimension.padding(figPadding: 18, context: context),
                    ),
                  ),

                  SizedBox(width: AppDimension.width(figmaWidth: 2, context: context),),

                  Text("Islami Bank New Eskaton, House 4, New Eskaton Road",style: TextStyle(
                    fontSize: AppDimension.width(figmaWidth: 10, context: context)
                  ),),
                  SizedBox(width: AppDimension.width(figmaWidth: 10, context: context),),
                ],
              ),
            ),

            // 2nd row components

            SizedBox(
              height: AppDimension.height(figmaHeight: 10, context: context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimension.padding(figPadding: 10, context: context),
                  right: AppDimension.padding(figPadding: 15, context: context),
                  top: AppDimension.padding(figPadding: 10, context: context),
                  bottom: AppDimension.padding(figPadding: 10, context: context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'DELIVERY TIME',
                          style: TextStyle(
                              fontSize: AppDimension.height(figmaHeight: 10, context: context),
                              fontWeight: FontWeight.normal,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDimension.height(figmaHeight: 2, context: context),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppDimension.padding(figPadding: 8, context: context)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppDimension.padding(figPadding: 2, context: context)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: AppDimension.padding(figPadding: 2, context: context), color: Colors.black12),
                    ),
                    child: Icon(
                      Icons.access_time,
                      color: Colors.black38,
                      size: AppDimension.padding(figPadding: 18, context: context),
                    ),
                  ),

                  SizedBox(width: AppDimension.padding(figPadding: 20, context: context),),

                  Text("5 hrs - 24hrs",style: TextStyle(
                      fontSize: AppDimension.padding(figPadding: 20, context: context)
                  ),),
                  SizedBox(width: AppDimension.width(figmaWidth: 10, context: context),),
                ],
              ),
            ),

            // 3rd row components

            SizedBox(
              height: AppDimension.height(figmaHeight: 10, context: context),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimension.height(figmaHeight: 15, context: context),
                  right: AppDimension.height(figmaHeight: 15, context: context),
                  top: AppDimension.height(figmaHeight: 10, context: context),
                  bottom: AppDimension.height(figmaHeight: 10, context: context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'ADDITIONAL COMMENTS',
                          style: TextStyle(
                              fontSize: AppDimension.height(figmaHeight: 10, context: context),
                              fontWeight: FontWeight.normal,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimension.height(figmaHeight: 15, context: context),
                  right: AppDimension.height(figmaHeight: 15, context: context),
                  top: AppDimension.height(figmaHeight: 10, context: context),
                  bottom: AppDimension.height(figmaHeight: 10, context: context)
              ),
              child: Material(
                child: TextFormField(
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(
                          AppDimension.height(figmaHeight: 20, context: context),
                          AppDimension.height(figmaHeight: 10, context: context),
                        AppDimension.height(figmaHeight: 20, context: context),
                           AppDimension.height(figmaHeight: 10, context: context)
                      ),
                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(AppDimension.height(figmaHeight: 6, context: context)),
                          borderSide: BorderSide(color: Colors.transparent, width: 0.0))
                  ),
                ),
              ),
            ),


            // START MAKING RESPONSIVE FROM HERE
            // 4th row components

            SizedBox(
              height: AppDimension.height(figmaHeight: 10, context: context),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppDimension.padding(figPadding: 10, context: context),
                right: AppDimension.padding(figPadding: 15, context: context),
                top: AppDimension.padding(figPadding: 10, context: context),
                bottom: AppDimension.padding(figPadding: 10, context: context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'PAYMENT METHOD',
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
            Padding(
              padding: EdgeInsets.only(
                left: AppDimension.padding(figPadding: 15, context: context),
                right: AppDimension.padding(figPadding: 15, context: context),
                top: AppDimension.padding(figPadding: 20, context: context),
                bottom: AppDimension.padding(figPadding: 20, context: context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: AppDimension.padding(figPadding: AppDimension.padding(figPadding: 2, context: context), context: context),
                            color: Colors.redAccent,
                          ),

                        borderRadius: BorderRadius.circular(AppDimension.padding(figPadding: 10, context: context)),

                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: AppDimension.padding(figPadding: 2, context: context),
                          right: AppDimension.padding(figPadding: 2, context: context),
                          top: AppDimension.padding(figPadding: 8, context: context),
                          bottom: AppDimension.padding(figPadding: 8, context: context),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.redAccent,
                              size: AppDimension.padding(figPadding: 20, context: context),
                            ),
                            SizedBox(width: AppDimension.padding(figPadding: 3, context: context),),
                            Text("Cash on Delivery", style: TextStyle(
                              fontSize: AppDimension.padding(figPadding: 15, context: context),
                            ),),
                          ],
                        ),
                      )
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: AppDimension.padding(figPadding: AppDimension.padding(figPadding: 2, context: context), context: context),
                            color: Colors.redAccent,
                          ),

                          borderRadius: BorderRadius.circular(AppDimension.padding(figPadding: 10, context: context)),

                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: AppDimension.padding(figPadding: 2, context: context),
                            right: AppDimension.padding(figPadding: 2, context: context),
                            top: AppDimension.padding(figPadding: 8, context: context),
                            bottom: AppDimension.padding(figPadding: 8, context: context),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.money,
                                color: Colors.redAccent,
                                size: AppDimension.padding(figPadding: 20, context: context),
                              ),
                              SizedBox(width: AppDimension.padding(figPadding: 3, context: context),),
                              Text("Online Payment", style: TextStyle(
                                fontSize: AppDimension.padding(figPadding: 15, context: context),
                              ),),
                            ],
                          ),
                        )
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Component = order details
            SizedBox(
              height: AppDimension.padding(figPadding: 10, context: context),
            ),
            Padding(
              padding: EdgeInsets.all(AppDimension.padding(figPadding: 8, context: context)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(AppDimension.padding(figPadding: 6, context: context)),
                ),
                child: Column(
                  children: [
                    // Title
                    Padding(
                      padding: EdgeInsets.all(AppDimension.padding(figPadding: 14, context: context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // title
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ORDER DETAILS',
                                  style: TextStyle(
                                      fontSize: AppDimension.padding(figPadding: 10, context: context),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Cash Payment',
                                  style: TextStyle(
                                      fontSize: AppDimension.padding(figPadding: 10, context: context),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimension.padding(figPadding: 2, context: context),),

                    // Orders from shops
                    ShopOrders(),
                    ShopOrders(),
                    ShopOrders(),
                    ShopOrders(),
                    ShopOrders(),
                    ShopOrders(),

                    // Total price calculator
                    TotalPrice(),

                  ],
                ),
              ),
            ),


          ],
        ),

    );
  }
}
