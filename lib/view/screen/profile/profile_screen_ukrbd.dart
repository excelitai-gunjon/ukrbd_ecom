


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecom_ukrbd/data/model/response/profile/profile_model.dart';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/provider/profile_provider_ukrbd.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/utill/images.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/not_loggedin_widget_ukrbd.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart'as http;


class ProfileScreenUkrbd extends StatefulWidget {
  bool isLogedIn=false;


   ProfileScreenUkrbd({this.isLogedIn=false,Key key}) : super(key: key);

  @override
  _ProfileScreenUkrbdState createState() => _ProfileScreenUkrbdState();
}

class _ProfileScreenUkrbdState extends State<ProfileScreenUkrbd> with SingleTickerProviderStateMixin{

  TabController _tabController;

  TextEditingController _nameController;
  TextEditingController _mobileController;
  TextEditingController _imageController;
  TextEditingController _addressController;

  FocusNode _nameFocus;
  FocusNode _mobileFocus;
  FocusNode _imageFocus;
  FocusNode _addressFocus;


  @override
  void initState() {
    // TODO: implement initState
    _nameController=TextEditingController();
    _mobileController=TextEditingController();
    _imageController=TextEditingController();
    _addressController=TextEditingController();

    _nameFocus=FocusNode();
    _mobileFocus=FocusNode();
    _imageFocus=FocusNode();
    _addressFocus=FocusNode();

    _load(context,true);


    _tabController=TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _imageController.dispose();

    _nameFocus.dispose();
    _mobileFocus.dispose();
    _imageFocus.dispose();
    _addressFocus.dispose();

    _addressController.dispose();
    super.dispose();
  }

  _load(BuildContext context,bool reload)async{
    await Provider.of<ProfileProviderUkrbd>(context,listen: false).getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer2<AuthProviderUkrbd,ProfileProviderUkrbd>(
      builder: (context,authProviderUkrbd,profileProviderUkrbd,child){


        String nameHint;
        String mobileHint;
        String addressHint;

        if(!profileProviderUkrbd.isLoading && authProviderUkrbd.getUserToken().length>0){
          nameHint=profileProviderUkrbd.user.customerName??'';
          mobileHint=profileProviderUkrbd.user.customerMobile??'';
          addressHint=profileProviderUkrbd.user.customerAddress??'';
          // _imageController.text=profileProviderUkrbd.user.image??'';
        }

        return Scaffold(

          // bottomNavigationBar:
          // bottomNavigationBarProvider.bottomNavigationBar(context, false),
          //
          // backgroundColor: ColorResources.getHomeBg(context),
          // resizeToAvoidBottomInset: false,

          body: authProviderUkrbd.getUserToken().length>0?

          SingleChildScrollView(
            child: Column(
              children: [
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
                        // IconButton(onPressed: (){
                        //  // Navigator.pop(context);
                        //
                        // }, icon: Icon(Icons.arrow_back,color: Colors.white,),
                        // ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(50),
                                    child:FadeInImage.assetNetwork(
                                      placeholder: Images.placeholder, width: 50,
                                      height: 50, fit: BoxFit.cover,
                                      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLFlEKjQHLInSZGzlfwIAnCrqCOF3chDGhR6ZKfSw&s',
                                      imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder,
                                          width: 50, height: 50, fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        profileProviderUkrbd.isLoading==false?Text("${profileProviderUkrbd.user.customerName??''}",style: TextStyle(color: Colors.white),):Shimmer.fromColors(child: Text(""), baseColor: Colors.grey, highlightColor: Colors.black38),
                                        profileProviderUkrbd.isLoading==false?Text("${profileProviderUkrbd.user.customerMobile??''}",style: TextStyle(color: Colors.white),):Shimmer.fromColors(child: Text(""), baseColor: Colors.grey, highlightColor: Colors.black38),
                                        // Text("${profileProviderUkrbd.user.customerMobile??''}",style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ClipRRect(

                              borderRadius: BorderRadius.circular(5),
                              child: InkWell(
                                onTap: (){
                                  authProviderUkrbd.logOut(context);
                                },
                                child: authProviderUkrbd.isLoading==false?Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height: 30,
                                  //width: 90,
                                  color: Colors.deepOrangeAccent,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Logout  ",style: TextStyle(color: Colors.white),),
                                      Icon(Icons.logout_outlined,size: 12,color: Colors.white,)
                                    ],
                                  ),
                                ):SizedBox(
                                  height: 30,
                                  width: 90,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                              // Tab(
                              //   child: Column(
                              //     children: [
                              //       Text("0"),
                              //       Text("My Wish List",style: TextStyle(fontSize: 10),),
                              //     ],
                              //   ),
                              // ),
                              Tab(
                                child: Column(
                                  children: [
                                    profileProviderUkrbd.isLoading==false?Text("৳ ${profileProviderUkrbd.user.amount??""}",style: TextStyle(color: Colors.white),):Shimmer.fromColors(child: Text(""), baseColor: Colors.grey, highlightColor: Colors.black38),
                                    // Text("৳ ${profileProviderUkrbd.user.amount??0}"),
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
                          padding: const EdgeInsets.only(left: 16,top: 50,right: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //SizedBox(height: 100,),
                                Text('Name',style: TextStyle(color: Colors.black45,fontSize: 13),),
                                CustomTextField(
                                  hintText: nameHint,
                                  controller: _nameController,
                                  focusNode: _nameFocus,
                                  nextNode: _mobileFocus,
                                ),
                                Text('Mobile Number',style: TextStyle(color: Colors.black45,fontSize: 13),),
                                CustomTextField(
                                  hintText: mobileHint,
                                  controller: _mobileController,
                                  focusNode: _mobileFocus,
                                  nextNode: _addressFocus,
                                  textInputType: TextInputType.phone,
                                ),
                                // Text('Image',style: TextStyle(color: Colors.black45,fontSize: 18),),
                                // CustomTextField(
                                //   hintText: '01XXXXXXXXX',
                                //   controller: _nameController,
                                //   focusNode: _nameFocus,
                                //   nextNode: _mobileFocus,
                                // ),
                                Text('Address',style: TextStyle(color: Colors.black45,fontSize: 13),),
                                CustomTextField(
                                  hintText: addressHint,
                                  controller: _addressController,
                                  focusNode: _addressFocus,
                                  // nextNode: ,
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    profileProviderUkrbd.isLoading==false?ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Theme.of(context).primaryColor
                                      ),
                                      onPressed: ()async{

                                        // if(_nameController.text.isEmpty){
                                        //   _nameController.text=nameHint;
                                        // }
                                        // if(_mobileController.text.isEmpty){
                                        //   _mobileController.text=mobileHint;
                                        // }
                                        // if(_addressController.text.isEmpty){
                                        //   _addressController.text=addressHint;
                                        // }
                                        final token=authProviderUkrbd.getUserToken();

                                        User _user=User();

                                        _user..customerName=_nameController.text.trim();
                                        _user..customerMobile=_mobileController.text.trim();
                                        _user..customerAddress=_addressController.text.trim();

                                        print(_user.toJson().toString());

                                        await profileProviderUkrbd.updateUserProfile(_user, null, token,context).then((value) {
                                          if(value==201){
                                            _load(context, true);
                                          }
                                          return null;
                                        });



                                      }, child: Text("Update Profile"),
                                    ):SizedBox(
                                      height: 60,
                                      width: 100,
                                      child: Center(child: CircularProgressIndicator(),),
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                        // Column(
                        //   mainAxisSize: MainAxisSize.max,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Row(
                        //       mainAxisSize: MainAxisSize.max,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Icon(Icons.account_box_outlined)
                        //       ],
                        //     )
                        //   ],
                        // ),
                        WithDraw(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ):NotLoggedInWidgetUkrbd(),
        );
      },
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

  TextEditingController _phoneController =TextEditingController();

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
    return Consumer2<AuthProviderUkrbd,ProfileProviderUkrbd>(
      builder: (context,authProviderUkrbd,profileProviderUkrbd,child){

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
              CustomButton(onTap: ()async{

                if(_phoneController.text.isEmpty){

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please Enter a Phone No"),
                    backgroundColor: Colors.teal,
                  ));

                }else{
                  var headers = {
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ${authProviderUkrbd.getUserToken()}'
                  };
                  var request =await http.MultipartRequest('POST', Uri.parse('https://ukrbd.com/api/withdraw'));
                  request.fields.addAll({
                    'mobile': _phoneController.text.trim(),
                    'amount': "${profileProviderUkrbd.user.amount??0}",
                    'payment_type': selectedpayment,
                    'customerId': "${profileProviderUkrbd.user.userId??""}",
                    'customer_address': "${profileProviderUkrbd.user.customerAddress??""}",
                  });

                  request.headers.addAll(headers);

                  http.StreamedResponse response = await request.send();

                  if (response.statusCode == 200) {
                    // print(await response.stream.bytesToString());
                    final data= await response.stream.bytesToString();

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(data),
                      backgroundColor: Colors.teal,
                    ));
                  }
                  else {
                    // print(response.reasonPhrase);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(response.reasonPhrase.toString()),
                      backgroundColor: Colors.teal,
                    ));
                  }
                }



              },buttonText: 'WITHDRAW')
            ],
          ),
        );

      },

    );
  }
}
