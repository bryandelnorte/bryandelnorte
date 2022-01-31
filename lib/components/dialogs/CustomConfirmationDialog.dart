import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/main.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomConfirmationDialog extends StatelessWidget {
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
            Text('Delete folder?', style: boldTextStyle(size: 18)),
            16.height,
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                  "This will also permanently delete file inside the folder",
                  style: secondaryTextStyle()),
            ),
            16.height,
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecoration(
                          color: Colors.blueAccent,
                          radius: 8,
                          bgColor: appStore.isDarkModeOn
                              ? appStore.cardColor
                              : appBarBackgroundColor),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.close,
                                          color: Colors.blueAccent, size: 18))),
                              TextSpan(
                                  text: "Cancel",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.blueAccent)),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      finish(context);
                    }),
                  ),
                  16.width,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          boxDecoration(bgColor: Colors.blueAccent, radius: 8),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.delete,
                                          color: Colors.white, size: 18))),
                              TextSpan(
                                  text: "Delete",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ).onTap(() {
                      toast("Successfully Deleted");
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
