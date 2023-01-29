import 'package:country_code_picker/country_code.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/body/merchant_register_model.dart';
import 'package:ecom_ukrbd/data/model/body/register_model.dart';
import 'package:ecom_ukrbd/helper/email_checker.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
// import 'package:ecom_ukrbd/provider/profile_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';

import 'code_picker_widget.dart';
import 'otp_verification_screen.dart';

class MerchantSignUpWidgetUkrbd extends StatefulWidget {

  @override
  _MerchantSignUpWidgetUkrbdState createState() => _MerchantSignUpWidgetUkrbdState();
}

class _MerchantSignUpWidgetUkrbdState extends State<MerchantSignUpWidgetUkrbd> {

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _preAddressController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _referenceIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey;






  FocusNode _fullNameFocus = FocusNode();
  FocusNode _lNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  FocusNode _preAddressFocus = FocusNode();
  FocusNode _userIdFocus = FocusNode();
  FocusNode _referenceIdFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  MerchantRegisterModel register = MerchantRegisterModel();
  bool isEmailVerified = false;


  @override
  void dispose() {
    // TODO: implement dispose

    _fullNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _preAddressController.dispose();
    _userIdController.dispose();
    _referenceIdController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }


  final List<String> items = [
    'Male',
    'female',
    'Others',

  ];
  final List<String> paymentItems = [
    'bKash',
    'Nagad',
    'Rocket',

  ];
  String selectedValue;
  // String selectedpayment;





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


  addUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;


      String _name = _fullNameController.text.trim();
      String _mobile = _mobileController.text.trim();
      String _emailTxt = _emailController.text.trim();
      String _presentAddress = _preAddressController.text.trim();
      String _userId = _userIdController.text.trim();
      String _gender = selectedValue;
      String _referenceId = _referenceIdController.text.trim();
      String _passwordTxt = _passwordController.text.trim();
      String _confirmPasswordTxt = _confirmPasswordController.text.trim();

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
      //   register.fName = '${_fullNameController.text}';
      //   register.lName = _lastNameController.text ?? " ";
      //   register.email = _emailController.text;
      //   register.phone = _phoneNumber;
      //   register.password = _passwordController.text;
      //   await Provider.of<AuthProvider>(context, listen: false).registration(register, route);
      // }

      register.name = _name;
      register.mobile = _mobile;
      register.email = _emailTxt;
      register.presentAddress = _presentAddress;
      register.userId = _userId;
      register.referenceId = _referenceId;
      register.password = _passwordTxt;
      register.confirmPassword = _confirmPasswordTxt;
      await Provider.of<AuthProviderUkrbd>(context, listen: false).merchantRegistration(register: register,context: context);


    } else {
      isEmailVerified = false;
    }
  }

  // route(bool isRoute, String token, String tempToken, String errorMessage) async {
  //   String _phone = _countryDialCode+_mobileController.text.trim();
  //   if (isRoute) {
  //     if(Provider.of<SplashProvider>(context,listen: false).configModel.emailVerification){
  //       Provider.of<AuthProvider>(context, listen: false).checkEmail(_emailController.text.toString(), tempToken).then((value) async {
  //         if (value.isSuccess) {
  //           Provider.of<AuthProvider>(context, listen: false).updateEmail(_emailController.text.toString());
  //           //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => VerificationScreen(tempToken,'',_emailController.text.toString())), (route) => false);
  //
  //         }
  //       });
  //     }else if(Provider.of<SplashProvider>(context,listen: false).configModel.phoneVerification){
  //       Provider.of<AuthProvider>(context, listen: false).checkPhone(_phone,tempToken).then((value) async {
  //         if (value.isSuccess) {
  //           Provider.of<AuthProvider>(context, listen: false).updatePhone(_phone);
  //           //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => VerificationScreen(tempToken,_phone,'')), (route) => false);
  //
  //         }
  //       });
  //     }else{
  //       await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
  //       //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
  //       _emailController.clear();
  //       _passwordController.clear();
  //       _fullNameController.clear();
  //       _lastNameController.clear();
  //       _mobileController.clear();
  //       _confirmPasswordController.clear();
  //     }
  //
  //
  //   }
  //   else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
  //   }
  // }

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

    return ListView(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
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
                  focusNode: _fullNameFocus,
                  nextNode: _mobileFocus,
                  textInputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  controller: _fullNameController,
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
              //       top: Dimensions.MARGIN_SIZE_SMALL),
              //   child: CustomTextField(
              //     hintText: getTranslated('ENTER_YOUR_EMAIL', context),
              //     focusNode: _emailFocus,
              //     nextNode: _phoneFocus,
              //     textInputType: TextInputType.emailAddress,
              //     controller: _emailController,
              //   ),
              // ),



              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: Row(children: [
                  // CodePickerWidget(
                  //   onChanged: (CountryCode countryCode) {
                  //     _countryDialCode = countryCode.dialCode;
                  //   },
                  //   initialSelection: _countryDialCode,
                  //   favorite: [_countryDialCode],
                  //   showDropDownButton: true,
                  //   padding: EdgeInsets.zero,
                  //   showFlagMain: true,
                  //   textStyle: TextStyle(color: Theme.of(context).textTheme.headline1.color),
                  //
                  // ),



                  Expanded(child: CustomTextField(
                    hintText: getTranslated('ENTER_MOBILE_NUMBER', context),
                    controller: _mobileController,
                    focusNode: _mobileFocus,
                    nextNode: _emailFocus,
                    isPhoneNumber: true,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,

                  )),
                ]),
              ),

              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                    top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText: getTranslated('ENTER_YOUR_EMAIL', context),
                  focusNode: _emailFocus,
                  nextNode: _preAddressFocus,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
              ),


              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                    top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText: 'Present Address',//getTranslated('ENTER_YOUR_EMAIL', context),
                  focusNode: _preAddressFocus,
                  nextNode: _userIdFocus,
                  textInputType: TextInputType.emailAddress,
                  controller: _preAddressController,
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                    top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText: 'User id(Email/Mobile)',//getTranslated('ENTER_YOUR_EMAIL', context),
                  focusNode: _userIdFocus,
                  nextNode: _referenceIdFocus,
                  textInputType: TextInputType.emailAddress,
                  controller: _userIdController,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Select Gender',
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
              ),

              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                    top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText: 'Reference Id (Optional)',//getTranslated('ENTER_YOUR_EMAIL', context),
                  focusNode: _referenceIdFocus,
                  nextNode: _passwordFocus,
                  textInputType: TextInputType.emailAddress,
                  controller: _referenceIdController,
                ),
              ),




              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomPasswordTextField(
                  hintTxt: getTranslated('PASSWORD', context),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  nextNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.next,
                ),
              ),



              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomPasswordTextField(
                  hintTxt: 'Confirm Password',//getTranslated('RE_ENTER_PASSWORD', context),
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
        ),



        Container(
          margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_LARGE, right: Dimensions.MARGIN_SIZE_LARGE,
              bottom: Dimensions.MARGIN_SIZE_LARGE, top: Dimensions.MARGIN_SIZE_LARGE),
          child: Provider.of<AuthProviderUkrbd>(context).isLoading
              ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          )
              : CustomButton(onTap: addUser, buttonText: getTranslated('SIGN_UP', context)),
        ),

        // SocialLoginWidget(),

        // for skip for now
        Provider.of<AuthProviderUkrbd>(context).isLoading ? SizedBox() :
        Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [TextButton(
                  onPressed: () {
                    // return Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashBoardScreen()));
                  },
                  child: Text(getTranslated('SKIP_FOR_NOW', context),
                      style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT,
                          color: ColorResources.getPrimary(context)))),
                Icon(Icons.arrow_forward, size: 15,color: Theme.of(context).primaryColor,)
              ],
            )),
      ],
    );
  }
}



const List<String> list = <String>['Select Gender', 'Male', 'Female', 'Other'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample();

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}


class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(

      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black45),
      underline: Container(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (String value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
