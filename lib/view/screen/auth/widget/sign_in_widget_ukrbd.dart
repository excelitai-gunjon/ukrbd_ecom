import 'package:ecom_ukrbd/provider/bottom_navigation_bar_provider.dart';
import 'package:ecom_ukrbd/provider/cart_provider_ukrbd.dart';
import 'package:ecom_ukrbd/view/screen/checkout/checkout_screen_ukrbd.dart';
import 'package:flutter/material.dart';
import 'package:ecom_ukrbd/data/model/body/login_model.dart';
import 'package:ecom_ukrbd/localization/language_constrants.dart';
import 'package:ecom_ukrbd/provider/auth_provider.dart';
import 'package:ecom_ukrbd/provider/splash_provider.dart';
import 'package:ecom_ukrbd/utill/color_resources.dart';
import 'package:ecom_ukrbd/utill/custom_themes.dart';
import 'package:ecom_ukrbd/utill/dimensions.dart';
import 'package:ecom_ukrbd/view/basewidget/button/custom_button.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:ecom_ukrbd/view/basewidget/textfield/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignInWidgetUkrbd extends StatefulWidget {

  final bool isCheckOut;
  SignInWidgetUkrbd({this.isCheckOut});

  @override
  _SignInWidgetUkrbdState createState() => _SignInWidgetUkrbdState();
}

class _SignInWidgetUkrbdState extends State<SignInWidgetUkrbd> {

  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.text = Provider.of<AuthProvider>(context, listen: false).getUserEmail() ?? null;
    _passwordController.text = Provider.of<AuthProvider>(context, listen: false).getUserPassword() ?? null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  LoginModel loginBody = LoginModel();

  void loginUser() async {

    if (_formKeyLogin.currentState.validate()) {
      _formKeyLogin.currentState.save();

      String _email = _emailController.text.trim();
      String _password = _passwordController.text.trim();

      if (_email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else {

        if (Provider.of<AuthProvider>(context, listen: false).isRemember) {
          Provider.of<AuthProvider>(context, listen: false).saveUserEmail(_email, _password);
        } else {
          Provider.of<AuthProvider>(context, listen: false).clearUserEmailAndPassword();
        }

        loginBody.email = _email;
        loginBody.password = _password;

        await Provider.of<AuthProvider>(context, listen: false).login(loginBody, route,context).then((value) async{

          if(value==201){
            if(widget.isCheckOut){
              final subTotal=Provider.of<CartProviderUkrbd>(context,listen: false).subTotal;
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => CheckoutUkrbd(cartSubTotal: subTotal.toString(),)));
            }else{
              await Provider.of<BottomNavigationBarProvider>(context, listen: false).onItemTapped(2, false, context);
            }
          }else{
            null;
          }
        });
      }
    }
  }

  route(bool isRoute, String token, String temporaryToken, String errorMessage) async {
    if (isRoute) {
      if(token==null || token.isEmpty){
        if(Provider.of<SplashProvider>(context,listen: false).configModel.emailVerification){
          Provider.of<AuthProvider>(context, listen: false).checkEmail(_emailController.text.toString(),
              temporaryToken).then((value) async {
            if (value.isSuccess) {
              Provider.of<AuthProvider>(context, listen: false).updateEmail(_emailController.text.toString());
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => VerificationScreen(
              //     temporaryToken,'',_emailController.text.toString())), (route) => false);

            }
          });
        }else if(Provider.of<SplashProvider>(context,listen: false).configModel.phoneVerification){
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MobileVerificationScreen(
          //     temporaryToken)), (route) => false);
        }
      }
      else{

      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).isRemember;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_LARGE),
      child: Form(
        key: _formKeyLogin,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
          children: [


            Container(
                margin:
                EdgeInsets.only(bottom: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText: 'Enter Your email',//getTranslated('ENTER_YOUR_EMAIL_or_mobile', context),
                  focusNode: _emailNode,
                  nextNode: _passNode,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                )),



            Container(
                margin:
                EdgeInsets.only(bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: CustomPasswordTextField(
                  hintTxt: getTranslated('ENTER_YOUR_PASSWORD', context),
                  textInputAction: TextInputAction.done,
                  focusNode: _passNode,
                  controller: _passwordController,
                )),



            Container(
              margin: EdgeInsets.only(right: Dimensions.MARGIN_SIZE_SMALL),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Row(children: [
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) => Checkbox(
                      checkColor: ColorResources.WHITE,
                      activeColor: Theme.of(context).primaryColor,
                      value: authProvider.isRemember,
                      onChanged: authProvider.updateRemember,),),


                  Text(getTranslated('REMEMBER', context), style: titilliumRegular),
                ],),

                  InkWell(
                    onTap: () {
                      // return Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordScreen()));
                    },
                    child: Text(getTranslated('FORGET_PASSWORD', context),
                        style: titilliumRegular.copyWith(
                        color: ColorResources.getLightSkyBlue(context))),
                  ),
                ],
              ),
            ),



            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
              child: Provider.of<AuthProvider>(context).isLoading ?
              Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),),) :
              CustomButton(onTap: loginUser, buttonText: getTranslated('SIGN_IN', context)),),
            SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),


          ],
        ),
      ),
    );


  }

}
