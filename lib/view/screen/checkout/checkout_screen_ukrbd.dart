import 'package:country_code_picker/country_code_picker.dart';
import 'package:ecom_ukrbd/data/model/body/order_place_model.dart';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/order_place_provider.dart';
import 'package:ecom_ukrbd/provider/profile_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/basewidget/not_loggedin_widget_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';
import '../../../provider/bottom_navigation_bar_provider.dart';

class CheckoutUkrbd extends StatefulWidget {
  static const String routeName = "/checkoutUkrbd";

  String cartSubTotal;
   CheckoutUkrbd({Key key,this.cartSubTotal}) : super(key: key);

  @override
  State<CheckoutUkrbd> createState() => _CheckoutUkrbdState();
}

class _CheckoutUkrbdState extends State<CheckoutUkrbd> {

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _referenceController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey;

  FocusNode _fNameFocus = FocusNode();
  FocusNode _lNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _referenceFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  OrderPlaceModel orderPlaceModel = OrderPlaceModel();
  bool isEmailVerified = false;


  String fullName;
  String address;
  String email;
  String mobile;
  String reference;



  placeOrder() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;

      String _firstName = _fullNameController.text.trim();
      String _lastName = _lastNameController.text.trim();
      String _email = _emailController.text.trim();
      String _phone = _phoneController.text.trim();
      String _phoneNumber = _countryDialCode+_phoneController.text.trim();
      String _password = _passwordController.text.trim();
      String _confirmPassword = _confirmPasswordController.text.trim();

      // if (_firstName.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('first_name_field_is_required', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // }else if (_lastName.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('last_name_field_is_required', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // } else if (_email.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // }else if (EmailChecker.isNotValid(_email)) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('enter_valid_email_address', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // } else if (_phone.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // } else if (_password.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // } else if (_confirmPassword.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('CONFIRM_PASSWORD_MUST_BE_REQUIRED', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // } else if (_password != _confirmPassword) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)),
      //     backgroundColor: Colors.red,
      //   ));
      // } else {
      //   final cartList=Provider.of<CartProviderUkrbd>(context,listen: false).cartList;
      //   List productIdList;
      //   cartList.forEach((element) {
      //     productIdList.add(element.id);
      //   });
      //   List productQList=Provider.of<CartProviderUkrbd>(context,listen: false).itemCount;
      //
      //   orderPlaceModel.name = _fullNameController.text??fullName;
      //   orderPlaceModel.mobile = _phoneController.text ??mobile;
      //   orderPlaceModel.address = _addressController.text??address;
      //   orderPlaceModel.email = _emailController.text??email;
      //   orderPlaceModel.mobile = _phoneController.text??mobile;
      //   orderPlaceModel.referenceId = _referenceController.text??reference;
      //   orderPlaceModel.carts = productIdList.toString();
      //   orderPlaceModel.cartsQuantity = productQList.toString();
      //   await Provider.of<OrderPlaceProvider>(context, listen: false).orderPlace(orderPlaceModel, context);
      // }
      final cartList=Provider.of<CartProviderUkrbd>(context,listen: false).cartList;
      List productIdList=[];
      cartList.forEach((element) {
        productIdList.add(element.id);
      });
      List productQList=Provider.of<CartProviderUkrbd>(context,listen: false).itemCount;

      orderPlaceModel.name = _fullNameController.text.isEmpty?fullName:_fullNameController.text.trim();
      orderPlaceModel.mobile = _phoneController.text.isEmpty?mobile:_phoneController.text.trim();
      orderPlaceModel.address = _addressController.text.isEmpty?address:_addressController.text.trim();
      orderPlaceModel.email = _emailController.text.isEmpty?email:_emailController.text.trim();
      orderPlaceModel.mobile = _phoneController.text.isEmpty?mobile:_phoneController.text.trim();
      orderPlaceModel.referenceId = _referenceController.text.isEmpty?reference:_referenceController.text.trim();
      orderPlaceModel.carts = productIdList.toString();
      orderPlaceModel.cartsQuantity = productQList.toString();
      await Provider.of<OrderPlaceProvider>(context, listen: false).orderPlace(orderPlaceModel, context).then((value) {
        if(value==200){
          Provider.of<CartProviderUkrbd>(context,listen: false).deleteCart();
          Provider.of<BottomNavigationBarProvider>(context, listen: false).onItemTapped(0, false, context);
        }
      });

    } else {
      isEmailVerified = false;
    }
  }

  route(bool isRoute, String token, String tempToken, String errorMessage) async {
    String _phone = _countryDialCode+_phoneController.text.trim();
    if (isRoute) {
      if(Provider.of<SplashProvider>(context,listen: false).configModel.emailVerification){
        Provider.of<AuthProvider>(context, listen: false).checkEmail(_emailController.text.toString(), tempToken).then((value) async {
          if (value.isSuccess) {
            Provider.of<AuthProvider>(context, listen: false).updateEmail(_emailController.text.toString());
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => VerificationScreen(tempToken,'',_emailController.text.toString())), (route) => false);

          }
        });
      }else if(Provider.of<SplashProvider>(context,listen: false).configModel.phoneVerification){
        Provider.of<AuthProvider>(context, listen: false).checkPhone(_phone,tempToken).then((value) async {
          if (value.isSuccess) {
            Provider.of<AuthProvider>(context, listen: false).updatePhone(_phone);
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => VerificationScreen(tempToken,_phone,'')), (route) => false);

          }
        });
      }else{
        // await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
        _emailController.clear();
        _passwordController.clear();
        _fullNameController.clear();
        _lastNameController.clear();
        _phoneController.clear();
        _confirmPasswordController.clear();
      }


    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  String _countryDialCode = "+880";
  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context,listen: false).configModel;
    _countryDialCode = CountryCode.fromCountryCode(Provider.of<SplashProvider>(context, listen: false).configModel.countryCode).dialCode;

    _load(context, true);

    _formKey = GlobalKey<FormState>();
  }

  _load(BuildContext context,bool reload)async{
    await Provider.of<ProfileProviderUkrbd>(context,listen: false).getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer4<AuthProviderUkrbd,BottomNavigationBarProvider,ProfileProviderUkrbd,OrderPlaceProvider>(
        builder: (context,authProviderUkrbd,bottomNavigationBarProvider,profileProviderUkrbd,orderPlaceProvider,child){


          if(!profileProviderUkrbd.isLoading&&profileProviderUkrbd.profileModel!=null){
            if(profileProviderUkrbd.profileModel.user!=null){
              fullName=profileProviderUkrbd.profileModel.user.customerName;
              address=profileProviderUkrbd.profileModel.user.customerAddress;
              email=profileProviderUkrbd.profileModel.user.email;
              mobile=profileProviderUkrbd.profileModel.user.customerMobile;
              reference=profileProviderUkrbd.profileModel.user.referenceId;
            }
          }

          return Scaffold(
            bottomNavigationBar:
            bottomNavigationBarProvider.bottomNavigationBar(context, false),

            appBar: AppBar(
              leading: InkWell(onTap: (){
                Navigator.of(context).pop();
              },child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)),
              title: const Text("Checkout",
                style: TextStyle(
                    color: Colors.black
                ),),
              backgroundColor: Colors.white70,

            ),
            body: authProviderUkrbd.getUserToken().length>0?Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Text("BILLING DETAILS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),


                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                      child: Text("Full Name"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                          top: Dimensions.MARGIN_SIZE_SMALL),
                      child: CustomTextField(
                        hintText:fullName ,//getTranslated('ENTER_YOUR_EMAIL', context),
                        focusNode: _fNameFocus,
                        nextNode: _addressFocus,
                        textInputType: TextInputType.name,
                        capitalization: TextCapitalization.words,
                        controller: _fullNameController,
                      ),
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                      child: Text("Address"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                      child: CustomTextField(
                        hintText: address,//getTranslated('ENTER_YOUR_EMAIL', context),
                        focusNode: _addressFocus,
                        nextNode: _emailFocus,
                        textInputType: TextInputType.emailAddress,
                        controller: _addressController,
                      ),
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                      child: Text("Email"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.MARGIN_SIZE_DEFAULT,
                          right: Dimensions.MARGIN_SIZE_DEFAULT,
                          top: Dimensions.MARGIN_SIZE_SMALL),
                      child: CustomTextField(
                        hintText: email,
                        focusNode: _emailFocus,
                        nextNode: _phoneFocus,
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                      child: Text("Mobile"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                          top: Dimensions.MARGIN_SIZE_SMALL),
                      child: CustomTextField(
                        hintText: mobile,//getTranslated('ENTER_YOUR_EMAIL', context),
                        focusNode: _phoneFocus,
                        nextNode: _referenceFocus,
                        textInputType: TextInputType.emailAddress,
                        controller: _phoneController,
                      ),
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                      child: Text("Reference Id"),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                          top: Dimensions.MARGIN_SIZE_SMALL),
                      child: CustomTextField(
                        hintText: reference,//getTranslated('ENTER_YOUR_EMAIL', context),
                        focusNode: _referenceFocus,
                        // nextNode: _referenceFocus,
                        textInputType: TextInputType.emailAddress,
                        controller: _referenceController,
                        textInputAction: TextInputAction.done,
                      ),
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding:  EdgeInsets.symmetric(horizontal: 32,vertical: Dimensions.PADDING_SIZE_DEFAULT),

                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("YOUR ORDER",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("CART SUBTOTAL",style: TextStyle(color: Colors.black45),),
                                Text("৳ ${widget.cartSubTotal}",style: TextStyle(color: Colors.black45),),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PROFIT",style: TextStyle(color: Colors.black45),),
                                Text("৳ 0.0",style: TextStyle(color: Colors.black45),),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Total",style: TextStyle(color: Colors.black45),),
                                Text("৳ ${widget.cartSubTotal}",style: TextStyle(color: Colors.black45),),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: Dimensions.MARGIN_SIZE_LARGE,
                                right: Dimensions.MARGIN_SIZE_LARGE,
                                bottom: Dimensions.MARGIN_SIZE_LARGE,
                                top: Dimensions.MARGIN_SIZE_LARGE,
                              ),
                              child:orderPlaceProvider.isLoading
                                  ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                                  : CustomButton(
                                onTap: placeOrder,
                                buttonText:'PLACE ORDER',// getTranslated('SIGN_UP', context)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ):NotLoggedInWidgetUkrbd(isCheckOut: true,),
          );

        }
    );




  }
}
