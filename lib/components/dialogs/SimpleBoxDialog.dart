import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vipco_mega_wallet/main.dart';
// import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:nb_utils/nb_utils.dart';

class SimpleBoxDialog extends StatelessWidget {
  final String titleMessage;
  final String bodyMessage;

  SimpleBoxDialog(this.titleMessage, this.bodyMessage);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: appStore.isDarkModeOn
              ? appStore.cardColor
              : appBarBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
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
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.centerRight,
                child: Icon(Icons.close,
                    color: appStore.isDarkModeOn
                        ? appBarBackgroundColor
                        : scaffoldColorDark),
              ),
            ),
            Text(this.titleMessage,
                textAlign: TextAlign.center,
                style: boldTextStyle(size: dialogHeadingFontSize)),
            16.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(this.bodyMessage,
                  style: secondaryTextStyle(size: dialogBodyFontSize)),
            ),
            40.height,
          ],
        ),
      ),
    );
  }
}
