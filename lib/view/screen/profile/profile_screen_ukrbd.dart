

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/not_loggedin_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';


class ProfileScreenUkrbd extends StatefulWidget {
  const ProfileScreenUkrbd({Key key}) : super(key: key);

  @override
  _ProfileScreenUkrbdState createState() => _ProfileScreenUkrbdState();
}

class _ProfileScreenUkrbdState extends State<ProfileScreenUkrbd> with SingleTickerProviderStateMixin{

  TabController _tabController;

  bool isLogedIn=false;

  @override
  void initState() {
    // TODO: implement initState
    _tabController=TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLogedIn?Stack(
        children: [

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height*.7,
              width: size.width,
              color: Color(0xffffffff),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 100,right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 100,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.account_box_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Account Information",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.add_location_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Addresses",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.checklist_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Your Orders",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.app_settings_alt_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Setting",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.account_box_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Log out",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.account_box_outlined)
                        ],
                      )
                    ],
                  ),
                  WithDraw(),
                ],
              ),
            ),
          ),

          ClipPath(
            child: Container(
              height: size.height*.3,
              width: size.width,
              // color: Color(0xffce113b),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                    colors: [
                      // Colors,
                      Color(0xff4caf50),
                      Color(0xffffeb3b),//Color(0xff4caf50)), ColorSwatch(primary value: Color(0xffffeb3b)
                      // Color(0xff4caf50),
                      // Colors.white
                    ],
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ClipRRect(borderRadius: BorderRadius.circular(50),
                      child:FadeInImage.assetNetwork(
                        placeholder: Images.placeholder, width: 50,
                        height: 50, fit: BoxFit.cover,
                        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLFlEKjQHLInSZGzlfwIAnCrqCOF3chDGhR6ZKfSw&s',
                        imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder,
                            width: 50, height: 50, fit: BoxFit.cover),
                      ),),
                  ),

                  //SizedBox(height: 10,),

                  TabBar(
                    controller: _tabController,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: [
                    Tab(
                      child: Column(
                        children: [
                          Text(""),
                          Text("My Profile",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Text("0"),
                          Text("My Wish List",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Text("\$ 450"),
                          Text("Withdraw",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                  ])

                ],
              ),
              padding: EdgeInsets.all(9),

            ),
            clipper: MyClipper(),
          ),
        ],
      ):NotLoggedInWidgetUkrbd(),
    );
  }
}



class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double factor = 20.0;
    var path = Path();
    path.lineTo(0, size.height - factor);
    path.quadraticBezierTo(0, size.height, factor, size.height);
    path.lineTo(size.width-factor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - factor);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(factor, 0);
    // path.quadraticBezierTo(0, 0, 0, factor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}


class WithDraw extends StatefulWidget {
  const WithDraw({Key key}) : super(key: key);

  @override
  _WithDrawState createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDraw> {

  TextEditingController _phoneController;

  FocusNode _phoneFocus;


  final List<String> items = [
    '0',

  ];
  final List<String> paymentItems = [
    'bKash',
    'Nagad',
    'Rocket',

  ];
  String selectedValue;
  String selectedpayment;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }
  List<double> _getCustomItemsHeightsForPayment() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (paymentItems.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      // color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(
            height: 60,
          ),

          Text("WITHDRAW",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Divider(

          ),
          Text('Profit',style: TextStyle(color: Colors.black45,fontSize: 18),),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                '0',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: _addDividersAfterItems(items),
              customItemsHeights: _getCustomItemsHeights(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              buttonHeight: 50,
              buttonPadding: EdgeInsets.symmetric(horizontal: 20),
              dropdownMaxHeight: 200,
              buttonWidth: double.infinity,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                ),
                //color: Colors.redAccent,
              ),
            ),
          ),
          Divider(),
          Text('Bonus',style: TextStyle(color: Colors.black45,fontSize: 18),),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                '0',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: _addDividersAfterItems(items),
              customItemsHeights: _getCustomItemsHeights(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
              buttonHeight: 50,
              buttonPadding: EdgeInsets.symmetric(horizontal: 20),
              dropdownMaxHeight: 200,
              buttonWidth: double.infinity,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                ),
                //color: Colors.redAccent,
              ),
            ),
          ),
          Divider(),
          Text('Select a Payment System',style: TextStyle(color: Colors.black45,fontSize: 18),),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                'Select item',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: _addDividersAfterItems(paymentItems),
              customItemsHeights: _getCustomItemsHeightsForPayment(),
              value: selectedpayment,
              onChanged: (value) {
                setState(() {
                  selectedpayment = value as String;
                });
              },
              buttonHeight: 50,
              buttonPadding: EdgeInsets.symmetric(horizontal: 20),
              dropdownMaxHeight: 200,
              buttonWidth: double.infinity,
              itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black26,
                ),
                //color: Colors.redAccent,
              ),
            ),
          ),
         // Divider(),
          Text('Phone Number',style: TextStyle(color: Colors.black45,fontSize: 18),),
          CustomTextField(
            hintText: '01XXXXXXXXX',
            controller: _phoneController,
            focusNode: _phoneFocus,
            nextNode: _phoneFocus,
          ),
          Divider(),
          CustomButton(buttonText: 'WITHDRAW')
        ],
      ),
    );
  }
}
