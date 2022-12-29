import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/body/register_model.dart';
import 'package:ecom_ukrbd/helper/email_checker.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/profile_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';
import 'package:ecom_ukrbd/view/screen/auth/widget/code_picker_widget.dart';
import 'package:ecom_ukrbd/view/screen/checkout/widget/DeliveryDetails.dart';
import 'package:provider/provider.dart';
// import 'package:ecom_ukrbd/view/screen/checkout/DeliveryDetails.dart';

class CheckoutUkrbd extends StatefulWidget {
  String cartSubTotal;
   CheckoutUkrbd({Key key,this.cartSubTotal}) : super(key: key);

  @override
  State<CheckoutUkrbd> createState() => _CheckoutUkrbdState();
}

class _CheckoutUkrbdState extends State<CheckoutUkrbd> {
  // @override
  // Widget build(BuildContext context) {
  //   final size=MediaQuery.of(context).size;
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
  //       title: const Text("Checkout",
  //       style: TextStyle(
  //         color: Colors.black
  //       ),),
  //       backgroundColor: Colors.white70,
  //
  //     ),
  //     body: Padding(
  //       padding:  EdgeInsets.symmetric(horizontal: size.width*(16/360)),
  //       child: ListView(
  //         children: [
  //             // DeliveryDetails(),
  //
  //           SizedBox(height: size.width*(16/360),),
  //           Text("BILLING DETAILS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }
  TextEditingController _firstNameController = TextEditingController();
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

  RegisterModel register = RegisterModel();
  bool isEmailVerified = false;


  addUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;

      String _firstName = _firstNameController.text.trim();
      String _lastName = _lastNameController.text.trim();
      String _email = _emailController.text.trim();
      String _phone = _phoneController.text.trim();
      String _phoneNumber = _countryDialCode+_phoneController.text.trim();
      String _password = _passwordController.text.trim();
      String _confirmPassword = _confirmPasswordController.text.trim();

      if (_firstName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('first_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      }else if (_lastName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('last_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      }else if (EmailChecker.isNotValid(_email)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('enter_valid_email_address', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('CONFIRM_PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)),
          backgroundColor: Colors.red,
        ));
      } else {
        register.fName = '${_firstNameController.text}';
        register.lName = _lastNameController.text ?? " ";
        register.email = _emailController.text;
        register.phone = _phoneNumber;
        register.password = _passwordController.text;
        await Provider.of<AuthProvider>(context, listen: false).registration(register, route);
      }
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
        await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
        _emailController.clear();
        _passwordController.clear();
        _firstNameController.clear();
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


    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
      body: Column(
        // padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
        children: [
          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          //           Text("BILLING DETAILS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          SizedBox(
            height: MediaQuery.of(context).size.width*(360/360),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Text("BILLING DETAILS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),

                  // for first and last name
                  // Container(
                  //   margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT),
                  //   child: Row(
                  //     children: [
                  //       Expanded(child: CustomTextField(
                  //         hintText: getTranslated('FIRST_NAME', context),
                  //         textInputType: TextInputType.name,
                  //         focusNode: _fNameFocus,
                  //         nextNode: _lNameFocus,
                  //         isPhoneNumber: false,
                  //         capitalization: TextCapitalization.words,
                  //         controller: _firstNameController,)),
                  //       SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                  //
                  //
                  //       Expanded(child: CustomTextField(
                  //         hintText: getTranslated('LAST_NAME', context),
                  //         focusNode: _lNameFocus,
                  //         nextNode: _emailFocus,
                  //         capitalization: TextCapitalization.words,
                  //         controller: _lastNameController,)),
                  //     ],
                  //   ),
                  // ),


                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                        top: Dimensions.MARGIN_SIZE_SMALL),
                    child: CustomTextField(
                      hintText:'Full Name' ,//getTranslated('ENTER_YOUR_EMAIL', context),
                      focusNode: _fNameFocus,
                      nextNode: _addressFocus,
                      textInputType: TextInputType.name,
                      capitalization: TextCapitalization.words,
                      controller: _firstNameController,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                        top: Dimensions.MARGIN_SIZE_SMALL),
                    child: CustomTextField(
                      hintText: 'address',//getTranslated('ENTER_YOUR_EMAIL', context),
                      focusNode: _addressFocus,
                      nextNode: _emailFocus,
                      textInputType: TextInputType.emailAddress,
                      controller: _addressController,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                        top: Dimensions.MARGIN_SIZE_SMALL),
                    child: CustomTextField(
                      hintText: getTranslated('ENTER_YOUR_EMAIL', context),
                      focusNode: _emailFocus,
                      nextNode: _phoneFocus,
                      textInputType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                        top: Dimensions.MARGIN_SIZE_SMALL),
                    child: CustomTextField(
                      hintText: 'Mobile',//getTranslated('ENTER_YOUR_EMAIL', context),
                      focusNode: _phoneFocus,
                      nextNode: _referenceFocus,
                      textInputType: TextInputType.emailAddress,
                      controller: _phoneController,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                        top: Dimensions.MARGIN_SIZE_SMALL),
                    child: CustomTextField(
                      hintText: 'Reference id?',//getTranslated('ENTER_YOUR_EMAIL', context),
                      focusNode: _referenceFocus,
                      nextNode: _referenceFocus,
                      textInputType: TextInputType.emailAddress,
                      controller: _referenceController,
                    ),
                  ),

                ],
              ),
            ),
          ),



          Expanded(
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_DEFAULT),

              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("YOUR ORDER",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("CART SUBTOTAL",style: TextStyle(color: Colors.black45),),
                      Text("\$ ${widget.cartSubTotal}",style: TextStyle(color: Colors.black45),),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("PROFIT",style: TextStyle(color: Colors.black45),),
                      Text("\$ 0.0",style: TextStyle(color: Colors.black45),),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Order Total",style: TextStyle(color: Colors.black45),),
                      Text("\$ ${widget.cartSubTotal}",style: TextStyle(color: Colors.black45),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_LARGE, right: Dimensions.MARGIN_SIZE_LARGE,
                        bottom: Dimensions.MARGIN_SIZE_LARGE, top: Dimensions.MARGIN_SIZE_LARGE),
                    child: Provider.of<AuthProvider>(context).isLoading
                        ? Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                        : CustomButton(onTap: addUser,
                        buttonText:'PLACE ORDER',// getTranslated('SIGN_UP', context)
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SocialLoginWidget(),

          // for skip for now
          // Provider.of<AuthProvider>(context).isLoading ? SizedBox() :
          // Center(
          //     child: Row(mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [TextButton(
          //           onPressed: () {
          //             // return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashBoardScreen()));
          //           },
          //           child: Text(getTranslated('SKIP_FOR_NOW', context),
          //               style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT,
          //                   color: ColorResources.getPrimary(context)))),
          //         Icon(Icons.arrow_forward, size: 15,color: Theme.of(context).primaryColor,)
          //       ],
          //     )),
        ],
      ),
    );
  }
}
