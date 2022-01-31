import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/components/component/CategoryListComponent.dart';
import 'package:vipco_mega_wallet/components/component/CollectionListComponent.dart';
import 'package:vipco_mega_wallet/components/component/PopularListComponent.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/CategoryScreen.dart';
import 'package:vipco_mega_wallet/components/dashboard/CollectionScreen.dart';
import 'package:vipco_mega_wallet/components/dashboard/PopularScreen.dart';
import 'package:vipco_mega_wallet/components/dashboard/CategoryMenuScreen.dart';
// import 'package:vipco_mega_wallet/components/dashboard/SearchScreen.dart';

import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
// import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/FDHomeScreen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  int pageIndex = 0;

  PageController? pageControllerHome;

  List<HomeItemModel> homeItems = getHomeItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor,
        statusBarIconBrightness: Brightness.light);
    pageControllerHome =
        PageController(initialPage: pageIndex, viewportFraction: 0.9);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 130,
          title: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(vipco_label_logo_v3, height: 30),
                          8.width,
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.mail,
                                  color: primary_color, size: 20),
                              onPressed: () {})
                        ],
                      )
                    ],
                  ),
                  // Text('Bryan del Norte',
                  //     style:
                  //         boldTextStyle(color: white, size: headingFontSize)),
                  // 8.height,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.green,
                          shadowColor: Colors.green,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 4.0),
                                child: Text("Balance",
                                    style: secondaryTextStyle(
                                        color: Colors.white,
                                        size: secondaryFontSize)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "200.00",
                                    textAlign: TextAlign.center,
                                    style:
                                        boldTextStyle(color: white, size: 30),
                                  ),
                                ],
                              ).paddingBottom(8.0),
                              // Align(
                              //   alignment: Alignment.bottomRight,
                              //   child: Image.asset(
                              //     app_logo,
                              //     color: Colors.white,
                              //     fit: BoxFit.cover,
                              //     alignment: Alignment.bottomRight,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Colors.green,
                          shadowColor: Colors.green,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 4.0),
                                child: Text("Points",
                                    style: secondaryTextStyle(
                                        color: Colors.white,
                                        size: secondaryFontSize)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "10,000",
                                    textAlign: TextAlign.center,
                                    style:
                                        boldTextStyle(color: white, size: 30),
                                  ),
                                ],
                              ).paddingBottom(8.0),
                              // Align(
                              //   alignment: Alignment.bottomRight,
                              //   child: Image.asset(
                              //     app_logo,
                              //     color: Colors.white,
                              //     fit: BoxFit.cover,
                              //     alignment: Alignment.bottomRight,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(0),
            ],
          ),
        ),
        // appBar: AppBar(

        //   elevation: 0,
        //   title: widCreateRichText('My ', 'Order', FDPrimaryColor),
        //   automaticallyImplyLeading: false,
        //   toolbarHeight: 50,
        // ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              widTitleWidget(
                title1: 'Categories',
                title2: 'See All',
                onTap: () {
                  CategoryScreen(isCategoryFromHome: true).launch(context);
                },
              ),
              CategoryListComponent(isHome: true),
              8.height,
              widTitleWidget(
                title1: 'Popular',
                title2: 'See All',
                onTap: () {
                  PopularScreen(isFromHome: true).launch(context);
                },
              ),
              PopularListComponent(),
              8.height,
              widTitleWidget(title1: 'Voucher', title2: 'See All'),
              Image.asset(
                FDHomeImage1,
                width: context.width(),
                fit: BoxFit.fill,
              ).paddingAll(16).onTap(() {
                toast('Voucher');
              }),
              8.height,
              widTitleWidget(
                title1: 'Collections',
                title2: 'See All',
                onTap: () {
                  CollectionScreen().launch(context);
                },
              ),
              CollectionListComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
