import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/response/ukrbd/produuct_model.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/screen/cart/cart_screen_ukrbd.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';

import '../../../provider/bottom_navigation_bar_provider.dart';

class ProductDetailsScreenUkrbd extends StatefulWidget {
  static const String routeName = "/productDetailsScreenUkrbd";

  final Data productModel;
  ProductDetailsScreenUkrbd({Key key,this.productModel}) : super(key: key);

  @override
  State<ProductDetailsScreenUkrbd> createState() => _ProductDetailsScreenUkrbdState();
}

class _ProductDetailsScreenUkrbdState extends State<ProductDetailsScreenUkrbd> with SingleTickerProviderStateMixin{

  int _selectedIndex=0;
  int _counter=1;

  //TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState

    _load(context);
    //_tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  _load(BuildContext context)async{
    await Provider.of<CartProviderUkrbd>(context,listen: false).getCartList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    // final double offers =widget.productModel.discount.isNotEmpty?int.tryParse(widget.productModel.discount)/int.tryParse(widget.productModel.salesPrice)*100:0.0;
    // final int befor_discount=widget.productModel.discount.isNotEmpty?int.tryParse(widget.productModel.salesPrice)-int.tryParse(widget.productModel.discount):int.tryParse(widget.productModel.salesPrice);

    return Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomNavigationBarProvider, child){

          return Scaffold(
            bottomNavigationBar:
            bottomNavigationBarProvider.bottomNavigationBar(context, false),

            backgroundColor: ColorResources.getHomeBg(context),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0.5,
              title: Text("Product Details"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*(15/360)),
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.placeholder, fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.width*(300/360),width: MediaQuery.of(context).size.width*(300/360),
                      // image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
                      image: widget.productModel.productimages.isNotEmpty?"https://ukrbd.com/images/products/${widget.productModel.productimages[_selectedIndex].image}":"https://siparekraf.kamparkab.go.id/assets/images/no-image.png",
                      imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
                        fit: BoxFit.contain,height: MediaQuery.of(context).size.width*(300/360),width: MediaQuery.of(context).size.width*(300/360),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width*(10/360),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.productModel.productName??"",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width*(20/360), fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width*(25/360),
                        width: MediaQuery.of(context).size.width*(60/360),
                        child: Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width*(25/360),
                              width: MediaQuery.of(context).size.width*(25/360),
                              decoration: BoxDecoration(
                                border: Border.all(width: MediaQuery.of(context).size.width*(1/360),color: Colors.grey),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(Icons.favorite_border_rounded,size: MediaQuery.of(context).size.width*(15/360),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*(10/360),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width*(25/360),
                              width: MediaQuery.of(context).size.width*(25/360),
                              decoration: BoxDecoration(
                                border: Border.all(width: MediaQuery.of(context).size.width*(1/360),color: Colors.grey),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(Icons.share,size: MediaQuery.of(context).size.width*(15/360),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width*(10/360),
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "৳${widget.productModel.price??0.0}  " ,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*(20/360),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: widget.productModel.offerPrice!=null?'৳${widget.productModel.offerPrice}':"",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*(20/360),
                      ),
                      // Text.rich(
                      //   TextSpan(
                      //     text: 'Flat ${offers.toStringAsFixed(2)}% OFF ',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.normal,
                      //       color: Colors.green,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   children: [
                  //     Text.rich(
                  //       TextSpan(
                  //         children: [
                  //           TextSpan(
                  //             text: '5.0 ',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.normal,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     //stars
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.star_rate_sharp,
                  //           color: Colors.green,
                  //         ),
                  //         Icon(
                  //           Icons.star_rate_sharp,
                  //           color: Colors.green,
                  //         ),
                  //         Icon(
                  //           Icons.star_rate_sharp,
                  //           color: Colors.green,
                  //         ),
                  //         Icon(
                  //           Icons.star_border,
                  //           color: Colors.green,
                  //         ),
                  //         Icon(
                  //           Icons.star_border,
                  //           color: Colors.green,
                  //         ),
                  //       ],
                  //     ),
                  //
                  //     SizedBox(
                  //       width: size.width*(20/360),
                  //     ),
                  //
                  //     Text.rich(
                  //       TextSpan(
                  //         text: '| 0 Ratings',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.normal,
                  //           color: Colors.black38,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(height: 20,),

                  // size buttons

                  SizedBox(
                    height: MediaQuery.of(context).size.width*(70/360),
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.productModel.productimages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _selectedIndex=index;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.width*(70/360),
                                width: MediaQuery.of(context).size.width*(70/360),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(1, 1), // changes position of shadow
                                      ),
                                    ]
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*(10/360)),
                                  child: Padding(
                                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*(2/360)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: Images.placeholder, fit: BoxFit.cover,
                                      height: MediaQuery.of(context).size.width*(70/360),width: MediaQuery.of(context).size.width*(70/360),
                                      // image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
                                      image: "https://ukrbd.com/images/products/${widget.productModel.productimages[index].image}",
                                      imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
                                        fit: BoxFit.cover,height: MediaQuery.of(context).size.width*(70/360),width: MediaQuery.of(context).size.width*(70/360),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),

                  SizedBox(
                    height: size.width*(20/360),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.width*(35/360),
                        width: size.width*(75/360),
                        //  width: size.width*(75/360),
                        color: Theme.of(context).primaryColor,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: size.width*(-17.5/360),
                              top: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if(_counter>0){
                                        --_counter;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: size.width*(35/360),
                                    width: size.width*(35/360),
                                    // color: Colors.white,
                                    //alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.deepPurpleAccent,
                                            spreadRadius: 2,
                                            offset: Offset(0, 0),
                                          ),
                                        ]
                                    ),
                                    child: Center(
                                        child: Icon(FontAwesomeIcons.minus,size: size.width*(Dimensions.FONT_SIZE_DEFAULT/360),)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: size.width*(-17.5/360),
                              top: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    ++_counter;
                                  });
                                },
                                // autofocus: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: size.width*(35/360),
                                    width: size.width*(35/360),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.deepPurpleAccent,
                                            spreadRadius: 2,
                                            offset: Offset(0, 0),
                                          ),
                                        ]
                                    ),
                                    child: Center(
                                      child: Icon(FontAwesomeIcons.plus,size: size.width*(Dimensions.FONT_SIZE_DEFAULT/360),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(alignment: Alignment.center,child: Text("${_counter}",style: TextStyle(
                              fontSize: size.width*(14/360),
                            ),)),
                          ],
                        ),
                      ),
                      SizedBox(width: size.width*(20.5/360),),
                      Consumer<CartProviderUkrbd>(
                        builder: (context,cartProviderUkrbd,child){
                          return InkWell(
                            onTap: (){




                              if(_counter>0){





                                cartProviderUkrbd.addToCart(widget.productModel,_counter,context);


                                //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreenUkrbd()));

                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(size.width*(10/360)),
                              child: Container(
                                  height: size.width*(35/360),
                                  width: size.width*(80/360),
                                  color: Theme.of(context).primaryColor,
                                  child: Center(child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width*(5/360)),
                                    child: Text("Add To Cart",
                                      style: TextStyle(
                                        fontSize: size.width*(10/360),
                                      ),
                                      overflow: TextOverflow.clip,

                                    ),
                                  ))
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width*(20/360),
                  ),

                  Text("Description",style: TextStyle(fontSize: size.width*(24/360),fontWeight: FontWeight.bold,color: Colors.black87),),

                  // Text(widget.productModel.description),
                  Container(
                    width: size.width,
                    child: Html(
                      data: widget.productModel.description,
                      // tagsList: Html.tags..addAll(["bird", "flutter"]),
                      // style: {
                      //   "table": Style(
                      //     backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                      //   ),
                      //   "tr": Style(
                      //     border: Border(bottom: BorderSide(color: Colors.grey)),
                      //   ),
                      //   "th": Style(
                      //     padding: EdgeInsets.all(6),
                      //     backgroundColor: Colors.grey,
                      //   ),
                      //   "td": Style(
                      //     padding: EdgeInsets.all(6),
                      //     alignment: Alignment.topLeft,
                      //   ),
                      //   'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
                      // },
                      //   padding: EdgeInsets.all(8.0),
                      //   onLinkTap: (url) {
                      //     print("Opening $url...");
                      //   },
                      //   customRender: (node, children) {
                      //     if (node is dom.Element) {
                      //       switch (node.localName) {
                      //         case "custom_tag": // using this, you can handle custom tags in your HTML
                      //           return Column(children: children);
                      //       }
                      //     }
                      //   },
                    ),
                  )
                  //     TabBar(
                  //         controller: _tabController,
                  //         unselectedLabelColor: Colors.white,
                  //         labelColor: Colors.white,
                  //         indicatorColor: Colors.white,
                  //         tabs: [
                  //           Tab(
                  //             child: Column(
                  //               children: [
                  //                 Text("0"),
                  //                 Text("My Wishlist",style: TextStyle(fontSize: 10),),
                  //               ],
                  //             ),
                  //           ),
                  //           Tab(
                  //             child: Column(
                  //               children: [
                  //                 Text("0"),
                  //                 Text("Followed Stores",style: TextStyle(fontSize: 10),),
                  //               ],
                  //             ),
                  //           ),
                  //           Tab(
                  //             child: Column(
                  //               children: [
                  //                 Text("0"),
                  //                 Text("Vouchers",style: TextStyle(fontSize: 10),),
                  //               ],
                  //             ),
                  //           ),
                  //         ]
                  //     ),
                  //     TabBarView(
                  //       controller: _tabController,
                  //         children: [
                  //           Text(""),
                  //
                  // //           Html(
                  // //             data: """
                  // // <div>Follow<a class='sup'><sup>pl</sup></a>
                  // //   Below hr
                  // //     <b>Bold</b>
                  // // <h1>what was sent down to you from your Lord</h1>,
                  // // and do not follow other guardians apart from Him. Little do
                  // // <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  // // """,
                  // //             // padding: EdgeInsets.all(8.0),
                  // //             // onLinkTap: (url) {
                  // //             //   print("Opening $url...");
                  // //             // },
                  // //             // customRender: (node, children) {
                  // //             //   if (node is dom.Element) {
                  // //             //     switch (node.localName) {
                  // //             //       case "custom_tag": // using this, you can handle custom tags in your HTML
                  // //             //         return Column(children: children);
                  // //             //     }
                  // //             //   }
                  // //             // },
                  // //           ),
                  //           Text(""),
                  //           Text("data"),
                  //     ]),
                ],
              ),
            ),
          );

        }
    );



  }
}

class SizeButton extends StatelessWidget {
  const SizeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
          primary: Colors.white,
          shadowColor: Colors.black,

        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: 'S',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: '670.0',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.orange,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: '720.0',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}