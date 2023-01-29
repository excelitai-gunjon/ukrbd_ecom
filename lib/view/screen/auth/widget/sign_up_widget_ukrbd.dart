import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/body/register_model_ukrbd.dart';
import 'package:ecom_ukrbd/helper/email_checker.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/auth_provider_ukrbd.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignUpWidgetUkrbd extends StatefulWidget {
  @override
  _SignUpWidgetUkrbdState createState() => _SignUpWidgetUkrbdState();
}

class _SignUpWidgetUkrbdState extends State<SignUpWidgetUkrbd> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey;

  FocusNode _fNameFocus = FocusNode();
  FocusNode _lNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  RegisterModelUkrbd register = RegisterModelUkrbd();
  bool isEmailVerified = false;


  addUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;

      String _firstName = _firstNameController.text.trim();
      String _email = _emailController.text.trim();
      String _phone = _phoneController.text.trim();
      String _phoneNumber = _countryDialCode+_phoneController.text.trim();
      String _password = _passwordController.text.trim();
      String _confirmPassword = _confirmPasswordController.text.trim();

      if (_firstName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Full name field is required"),//getTranslated('first_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      }

      else if (_email.isEmpty) {
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
        register.name = '${_firstNameController.text}';
        //register. = _lastNameController.text ?? " ";
        register.email = _emailController.text;
        register.mobile = _phoneNumber;
        register.password = _passwordController.text;
        register.confirmPassword = _passwordController.text;


        await Provider.of<AuthProviderUkrbd>(context, listen: false).registration(register: register,context: context);
      }
    } else {
      isEmailVerified = false;
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

    return ListView(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [


              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT,
                    top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText:'Full Name' ,//getTranslated('ENTER_YOUR_EMAIL', context),
                  focusNode: _fNameFocus,
                  nextNode: _lNameFocus,
                  textInputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  controller: _firstNameController,
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
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: Row(children: [



                  Expanded(child: CustomTextField(
                    hintText: getTranslated('ENTER_MOBILE_NUMBER', context),
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    nextNode: _passwordFocus,
                    isPhoneNumber: true,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,
                    // onTap: (){
                    //   _phoneController.text="+91";
                    // },

                  )),
                ]),
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
                  hintTxt: getTranslated('RE_ENTER_PASSWORD', context),
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
