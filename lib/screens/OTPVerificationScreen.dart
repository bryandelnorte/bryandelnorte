import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:mighty_ui_kit/apps/groceryApp/screens/GSMainScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:vipco_mega_wallet/main.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vipco_mega_wallet/screens/DashBoardScreen.dart';
import 'package:vipco_mega_wallet/components/dialogs/CustomOneLineDialog.dart';

class OTPVerificationScreen extends StatefulWidget {
  static String tag = '/VerificationScreen';

  @override
  OTPVerificationScreenState createState() => OTPVerificationScreenState();
}

class OTPVerificationScreenState extends State<OTPVerificationScreen> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  late Timer timer;
  int counter = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (counter < 1) {
            timer.cancel();
          } else {
            counter = counter - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    errorController.close();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('',
          color: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.height,
            Text("Verify your number",
                style: boldTextStyle(size: headingFontSize)),
            30.height,
            Text(
              "We send the OTP Code to your mobile number, \nplease check it and enter below",
              style: secondaryTextStyle(size: secondaryFontSize),
              textAlign: TextAlign.center,
            ),
            30.height,
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              length: 6,
              obscureText: false,
              showCursor: false,
              animationType: AnimationType.fade,
              errorTextSpace: 30,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
                selectedFillColor: Colors.transparent,
                borderRadius: BorderRadius.circular(ecDefaultRadius1),
                selectedColor: Colors.green,
                inactiveColor: Colors.grey[300],
              ),
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(fontSize: 20, height: 1.6),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {},
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            10.height,
            counter == 0
                ? Text("Resend Code",
                        style: boldTextStyle(color: primary_color, size: 14))
                    .onTap(() {
                    startTimer();
                    counter = 60;
                    setState(() {});
                  })
                : Text("Resend code in $counter s",
                    style: primaryTextStyle(size: 14)),
            40.height,
            gsAppButton(
              context,
              'CONTINUE',
              () {
                if (textEditingController.text == "123456") {
                  finish(context);
                  DashBoardScreen().launch(context, isNewTask: true);
                  // String titleMessage = "Registration Successful!";
                  // String bodyMessage = "Please proceed to login.";
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) =>
                  //       CustomWithImageDialog(titleMessage, bodyMessage),
                  // );
                } else {
                  String bodyMessage = "Sorry! But your OTP is invalid.";
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        CustomOneLineDialog(bodyMessage),
                  );
                  this.textEditingController.text = "";
                }
              },
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
