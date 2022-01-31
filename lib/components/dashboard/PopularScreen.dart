import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/FoodDetailsScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class PopularScreen extends StatefulWidget {
  static String tag = '/FDPopularScreen';
  final bool isFromHome;

  PopularScreen({this.isFromHome = false});

  @override
  PopularScreenState createState() => PopularScreenState();
}

class PopularScreenState extends State<PopularScreen> {
  List<PopularItemModel> popularList = getPopularItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    if (widget.isFromHome) {
      setStatusBarColor(FDPrimaryColor,
          statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widAppBarWidget(title: 'Popular', elevation: 8, context: context)
          as PreferredSizeWidget?,
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(popularList.length, (index) {
            PopularItemModel mData = popularList[index];
            return Container(
              decoration: boxDecorationRoundedWithShadow(8),
              width: (context.width() - (3 * 16)) * 0.5,
              child: Column(
                children: [
                  8.height,
                  Image.asset(mData.image!,
                      width: context.width() * 0.25, fit: BoxFit.cover),
                  4.height,
                  Text(mData.name!, style: primaryTextStyle()),
                  8.height,
                ],
              ),
            ).onTap(() {
              FoodDetailsScreen(data: mData).launch(context);
            });
          }),
        ).paddingAll(16),
      ),
    );
  }
}
