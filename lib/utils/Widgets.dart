import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
// import 'package:mighty_ui_kit/apps/groceryApp/screens/GSOrderProgressDetailsScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';

Widget appButton(BuildContext context, String title, Function onTap) {
  return AppButton(
    width: context.width(),
    child: Text(title, style: boldTextStyle(color: Colors.white)),
    color: primary_color,
    shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
    onTap: onTap,
  );
}

Widget WalkThroughWidget(String image, String title, String subTitle) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image.validate(),
            height: 220, width: 220, fit: BoxFit.cover),
        60.height,
        Column(
          children: [
            Text(title.validate(),
                style: boldTextStyle(size: 20), textAlign: TextAlign.center),
            16.height,
            Text(subTitle.validate(),
                style: secondaryTextStyle(size: 16),
                textAlign: TextAlign.center),
          ],
        ),
      ],
    ),
  );
}

Widget commonCacheImageWidget(String? url, double? height,
    {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit);
  }
}

Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

Widget commonCachedNetworkImage(String? url,
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool usePlaceholderIfUrlEmpty = true,
    double? radius}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(
            height: height,
            width: width,
            fit: fit,
            alignment: alignment,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('images/newsblog/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget buildSocialLoginButton({String? img}) {
  return Container(
    width: 50,
    height: 50,
    padding: EdgeInsets.all(8),
    decoration: boxDecorationRoundedWithShadow(8),
    child: commonCachedNetworkImage(img, fit: BoxFit.cover),
  );
}

InputDecoration inputDecoration(
    {IconData? icon, String? hintText, String? prefixText}) {
  return InputDecoration(
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: primary_color)),
    focusedErrorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    errorBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusColor: primary_color,
    border: InputBorder.none,
    prefixIcon: Icon(icon, size: 20),
    // Padding(padding: EdgeInsets.all(15), child: Text('+91 ')),
    prefixText: prefixText,
    prefixStyle: primaryTextStyle(size: headingFontSize),
    hintText: hintText,
    hintStyle: secondaryTextStyle(size: headingFontSize),
  );
}

InputDecoration inputDecorationError({IconData? icon, String? hintText}) {
  return InputDecoration(
    enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: primary_color)),
    focusColor: primary_color,
    border: InputBorder.none,
    prefixIcon: Icon(icon, size: 20),
    hintText: hintText,
    hintStyle: secondaryTextStyle(size: headingFontSize),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? appBarBackgroundColor,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget gsAppButton(BuildContext context, String title, Function onTap) {
  return AppButton(
    width: context.width(),
    child: Text(title, style: boldTextStyle(color: Colors.white)),
    color: primary_color,
    shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
    onTap: onTap,
  );
}

Widget widCreateRichText(String text1, String text2, Color text1Color) {
  return createRichText(
    list: [
      TextSpan(
        text: text1,
        style: boldTextStyle(color: text1Color, size: headingFontSize),
      ),
      TextSpan(
        text: text2,
        style: boldTextStyle(color: FDSecondaryColor, size: headingFontSize),
      ),
    ],
  );
}

Widget widAppBarWidget(
    {BuildContext? context,
    required String title,
    List<Widget>? actions,
    double? elevation}) {
  return AppBar(
    elevation: elevation,
    title: Text(
      title,
      style: boldTextStyle(size: 20),
    ),
    leading: Icon(Icons.arrow_back_ios_outlined).onTap(
      () {
        finish(context!);
      },
    ),
    toolbarHeight: 70,
    actions: actions,
  );
}

Widget widAppButton(
    Color color, Function onTap, BuildContext context, String text) {
  return AppButton(
    width: context.width(),
    color: color,
    child: Text(
      text,
      style: primaryTextStyle(color: white),
    ),
    onTap: onTap,
  );
}

Widget widTitleWidget({required title1, required title2, Function? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title1,
        style: boldTextStyle(size: 16, color: grey),
      ),
      Text(
        title2,
        style: primaryTextStyle(color: FDSelectedTextColor),
      ).onTap(onTap),
    ],
  ).paddingOnly(left: 16, right: 16);
}



// InputDecoration inputDecoration({String? label}) {
//   return InputDecoration(
//     enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//     focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
//     labelText: label,
//     labelStyle: secondaryTextStyle(size: 14),
//   );
// }

// Widget myOrderWidget({Widget? ratingBar, required List<GSMyOrderModel> orderList, Function? onTap}) {
//   return ListView.builder(
//     padding: EdgeInsets.only(top: 8),
//     shrinkWrap: true,
//     physics: NeverScrollableScrollPhysics(),
//     itemCount: orderList.length,
//     itemBuilder: (context, index) {
//       GSMyOrderModel mData = orderList[index];

//       return Container(
//         padding: EdgeInsets.all(16),
//         decoration: boxDecorationWithRoundedCorners(
//           boxShadow: defaultBoxShadow(),
//           borderRadius: radius(0),
//           backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(mData.title!, style: boldTextStyle()),
//                     4.height,
//                     Text("Delivered on ${mData.date}", style: secondaryTextStyle()),
//                     4.height,
//                     Container(
//                       decoration: boxDecorationWithRoundedCorners(
//                           borderRadius: radius(4),
//                           backgroundColor: (mData.orderStatus == GSCompleted)
//                               ? Colors.green
//                               : (mData.orderStatus == GSOnProgress)
//                                   ? Colors.orangeAccent
//                                   : (mData.orderStatus == GSCancel)
//                                       ? Colors.red
//                                       : Container() as Color),
//                       padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
//                       child: Text(
//                           (mData.orderStatus == GSCompleted)
//                               ? "Completed"
//                               : (mData.orderStatus == GSOnProgress)
//                                   ? "Delivering"
//                                   : (mData.orderStatus == GSCancel)
//                                       ? "Canceled"
//                                       : Container() as String,
//                           style: boldTextStyle(color: Colors.white, size: 12)),
//                     ),
//                     8.height,
//                   ],
//                 ).expand(),
//                 Image.asset(mData.image!, height: 80, width: 80, fit: BoxFit.cover)
//               ],
//             ),
//             8.height,
//             Divider(),
//             ratingBar!
//           ],
//         ),
//       ).onTap(() {
//         GSOrderProgressDetailsScreen(orderProgressList: mData).launch(context);
//       }).paddingOnly(left: 16, right: 16, top: 8, bottom: 8);
//     },
//   );
// }

// Widget cartNotFound() {
//   return Container(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(gs_empty_cart, fit: BoxFit.cover, height: 80, width: 80),
//         8.height,
//         Text("You don't have any order yet.", style: boldTextStyle()),
//       ],
//     ),
//   );
// }

// class OrderStatusWidget extends StatelessWidget {
//   const OrderStatusWidget({
//     Key? key,
//     this.title,
//     this.message,
//     this.disabled = false,
//   }) : super(key: key);

//   final String? title;
//   final String? message;
//   final bool disabled;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               title!,
//               style: boldTextStyle(),
//             ),
//           ],
//         ).paddingLeft(16),
//       ],
//     );
//   }
// }

// Widget profileWidget(String title, String description) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: boldTextStyle()),
//           Text(description, style: secondaryTextStyle()),
//         ],
//       ),
//       Image.asset(gs_next_icon, height: 20, width: 20, fit: BoxFit.cover, color: gs_primary_color)
//     ],
//   ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
// }

// Widget helpWidget(String title, String image) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(title, style: boldTextStyle()),
//       Image.asset(image, height: 20, width: 20, color: gs_primary_color),
//     ],
//   ).paddingAll(16);
// }

// Widget gsStatusBarWithTitle(BuildContext context, String title) {
//   return AppBar(
//     backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
//     elevation: 1,
//     centerTitle: false,
//     automaticallyImplyLeading: false,
//     titleSpacing: 0,
//     title: Row(
//       children: [
//         IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: appStore.isDarkModeOn ? iconSecondaryColor : Colors.black,
//           ),
//           onPressed: () {
//             finish(context);
//           },
//         ),
//         8.width,
//         Text(title, style: boldTextStyle()),
//       ],
//     ),
//   );
// }

// bottomFilterDialog(BuildContext context, String title, List list, {int tappedIndex = 0}) {
//   return showModalBottomSheet(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16))),
//     context: context,
//     builder: (BuildContext context) {
//       return BottomSheet(
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//           topRight: Radius.circular(8),
//           topLeft: Radius.circular(8),
//         )),
//         onClosing: () {},
//         builder: (BuildContext context) {
//           return StatefulBuilder(
//               builder: (BuildContext context, setState) => Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(title, style: boldTextStyle(size: 18)),
//                       16.height,
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: List.generate(list.length, (index) {
//                           return Container(
//                             padding: EdgeInsets.only(top: 8, bottom: 8),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   list[index]['title'],
//                                   style: primaryTextStyle(),
//                                 ).expand(),
//                                 tappedIndex == index
//                                     ? Image.asset(
//                                         gs_next_icon,
//                                         color: gs_primary_color,
//                                         height: 18,
//                                         width: 18,
//                                       )
//                                     : Container()
//                               ],
//                             ),
//                           ).onTap(() {
//                             setState(() {
//                               tappedIndex = index;
//                             });
//                           });
//                         }),
//                       )
//                     ],
//                   ).paddingAll(16));
//         },
//       );
//     },
//   );
// }
