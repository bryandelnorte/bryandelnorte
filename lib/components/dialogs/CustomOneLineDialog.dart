import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vipco_mega_wallet/main.dart';
// import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomOneLineDialog extends StatelessWidget {
  final String bodyMessage;

  CustomOneLineDialog(this.bodyMessage);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: appStore.isDarkModeOn
              ? appStore.cardColor
              : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0)),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            24.height,
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(this.bodyMessage,
                  style: secondaryTextStyle(size: secondaryFontSize)),
            ),
            8.height,
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          boxDecoration(bgColor: primary_color, radius: 8),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "OK",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      // toast("Successfully Deleted");
                      finish(context);
                    }),
                  )
                ],
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
