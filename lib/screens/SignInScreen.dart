import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:vipco_mega_wallet/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:vipco_mega_wallet/screens/OTPVerificationScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController userCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
        statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : Colors.white);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonCachedNetworkImage(app_logo, height: 100, width: 100),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    32.height,
                    Text(
                      'Enter your mobile number',
                      style: secondaryTextStyle(size: secondaryFontSize),
                      textAlign: TextAlign.right,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please type in your mobile number.";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              autoFocus: true,
                              maxLength: 10,
                              controller: userCont,
                              textFieldType: TextFieldType.NAME,
                              textStyle:
                                  primaryTextStyle(size: headingFontSize),
                              decoration: inputDecoration(
                                  icon: Icons.phone,
                                  hintText: '●●●●●●●●●●',
                                  prefixText: '+63 | ')),
                          // 8.height,
                          // AppTextField(
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please type in your password.";
                          //     }
                          //     return null;
                          //   },
                          //   controller: passCont,
                          //   textFieldType: TextFieldType.PASSWORD,
                          //   decoration: inputDecoration(
                          //       icon: Icons.lock, hintText: 'Enter Password'),
                          // ),
                          15.height,
                          32.height,
                          Text(
                            'By tapping login, we\'ll collect your mobile number\'s network information to be able to send you a One-Time Password (OTP).',
                            style: secondaryTextStyle(size: secondaryFontSize),
                            textAlign: TextAlign.center,
                          ),
                          4.height,
                          AppButton(
                            height: ecButtonHeight.toDouble(),
                            width: context.width(),
                            text: 'NEXT',
                            textColor: white,
                            color: primary_color,
                            splashColor: white,
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                // ECDashboardScreen().launch(context);
                                if (userCont.text == "9999999999") {
                                  OTPVerificationScreen().launch(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('New Account Detected.')));
                                  OTPVerificationScreen().launch(context);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 24, horizontal: 16),
              ).paddingAll(ecDefaultPadding1),
              Text('Want to know more about us? visit our pages below.',
                  style: secondaryTextStyle(size: secondaryFontSize)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialLoginButton(img: facebook_icon),
                  16.width,
                  buildSocialLoginButton(img: google_icon),
                  16.width,
                  buildSocialLoginButton(img: twitter_icon),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                              child: Icon(
                            Icons.support_agent,
                            color: primary_color,
                            size: 18,
                          )),
                          TextSpan(text: ' Support Center'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(color: primary_color),
                    ).onTap(() {
                      print('Support Center');
                    }),
                  ],
                ),

                //   RichText(
                //     text: TextSpan(
                //       text: 'Don\'t have an account? ',
                //       style: secondaryTextStyle(),
                //       children: [
                //         TextSpan(
                //           recognizer: TapGestureRecognizer()
                //             ..onTap = () {
                //               SignUpScreen().launch(context);
                //             },
                //           text: 'Create new account',
                //           style: secondaryTextStyle(color: primary_color),
                //         ),
                //       ],
                //     ),
                //   )
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
