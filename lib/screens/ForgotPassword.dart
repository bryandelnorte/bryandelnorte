import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/screens/OTPVerificationScreen.dart';
import 'package:vipco_mega_wallet/screens/SignInScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:vipco_mega_wallet/components/dialogs/CustomDialog.dart';

class ForgotPassword extends StatefulWidget {
  State createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController userCont = TextEditingController();
  TextEditingController mailCont = TextEditingController();
  TextEditingController numCont = TextEditingController();
  TextEditingController countryCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController passReTypeCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool? val = false;

  List<IconData> _icons = [Icons.person, Icons.mail, Icons.phone, Icons.lock];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: appStore.cardColor,
      //   iconTheme: IconThemeData(
      //       color: appStore.isDarkModeOn
      //           ? appBarBackgroundColor
      //           : scaffoldColorDark),
      //   elevation: 0,
      //   leading: Icon(Icons.arrow_back).onTap(() {
      //     finish(context);
      //   }),
      // ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              16.height,
              commonCachedNetworkImage(app_logo, height: 80, width: 80),
              Container(
                // decoration: boxDecorationWithShadow(
                //   borderRadius: BorderRadius.circular(16),
                //   boxShadow: defaultBoxShadow(),
                //   backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('Create New Account', style: boldTextStyle()),
                    // 8.height,
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please type in your mobile number.";
                              } else if (value == '12345') {
                                return "Invalid mobile number.";
                              }
                              return null;
                            },
                            controller: numCont,
                            textFieldType: TextFieldType.PHONE,
                            decoration: inputDecoration(
                                icon: _icons[2],
                                hintText: 'Enter Mobile Number'),
                          ),
                          8.height,
                          AppTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please type in your password.";
                              } else if (value == '12345') {
                                String titleMessage = "Password Requirements:";
                                String bodyMessage =
                                    "a. At least 8 characters\nb. A combination of uppercase and lowercase letters\nc. There should be at least one number.";
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialog(titleMessage, bodyMessage),
                                );
                                return "Password did not meet the requirements.";
                              }
                              return null;
                            },
                            controller: passCont,
                            textFieldType: TextFieldType.PASSWORD,
                            decoration: inputDecoration(
                                icon: _icons[3], hintText: 'Enter Password'),
                          ),
                          8.height,
                          AppTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please type in your re-password.";
                              } else if (passCont.text != value) {
                                return "Password did not match.";
                              }
                              return null;
                            },
                            controller: passReTypeCont,
                            textFieldType: TextFieldType.PASSWORD,
                            decoration: inputDecoration(
                                icon: _icons[3], hintText: 'Re-Enter Password'),
                          ),
                          8.height,
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this.val,
                          onChanged: (bool? value) {
                            setState(() {
                              this.val = value;
                            });
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'By creating an account, you agree to our ',
                            style: secondaryTextStyle(),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // ECTerms().launch(context);
                                  },
                                text: 'Terms and Condition',
                                style: secondaryTextStyle(color: primary_color),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // ECTerms().launch(context);
                                  },
                                text: ' and ',
                                style: secondaryTextStyle(),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // ECTerms().launch(context);
                                  },
                                text: 'Privacy Policy.',
                                style: secondaryTextStyle(color: primary_color),
                              ),
                            ],
                          ),
                        ).expand(),
                      ],
                    ),
                    16.height,
                    AppButton(
                      height: ecButtonHeight.toDouble(),
                      width: context.width(),
                      text: 'CREATE ACCOUNT',
                      textColor: white,
                      color: primary_color,
                      splashColor: white,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (this.val == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              'You must agree to the Terms and Conditon and Privacy Policy.',
                              textAlign: TextAlign.center,
                            )));
                          } else {
                            OTPVerificationScreen().launch(context);
                          }
                        }
                      },
                    ),
                  ],
                ).paddingSymmetric(vertical: 24, horizontal: 16),
              ).paddingAll(ecDefaultPadding1),
            ],
          ),
          Positioned(
            bottom: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'I already have an account. ',
                    style: secondaryTextStyle(),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            SignInScreen().launch(context, isNewTask: true);
                          },
                        text: 'Sign In',
                        style: secondaryTextStyle(color: primary_color),
                      ),
                    ],
                  ),
                )
              ],
            ).withWidth(context.width()),
          ),
        ])
            .paddingOnly(top: 16, bottom: 16, right: 8, left: 8)
            .withHeight(context.height()),
      ),
    );
  }
}
