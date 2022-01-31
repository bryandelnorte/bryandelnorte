import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vipco_mega_wallet/screens/SignInScreen.dart';
// import 'package:mighty_ui_kit/apps/groceryApp/screens/GSDashboardScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class WalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen>
    with AfterLayoutMixin<WalkThroughScreen> {
  PageController pageController = PageController();
  List<Widget> pages = [];
  double? currentPage = 0;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInCubic;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      WalkThroughWidget(
          express_earn_logo,
          "Use the app, earn points - just like cash! Earned points can be used to transact within the mega app.",
          "EXPRESS EARN"),
      WalkThroughWidget(
          express_receive_logo,
          "Receive wallet transfers from other users/platforms and crypto wallets directly to your VIPCo.",
          "EXPRESS RECEIVE"),
      WalkThroughWidget(
          express_send_logo,
          "Send VIPCo currency to other users or other platforms with ease, 24/7.",
          "EXPRESS SEND"),
      WalkThroughWidget(
          express_order_logo,
          "Manage your time with our same day and scheduled deliveries together with our Pa-Buy and Pagawa services.",
          "EXPRESS ORDER"),
      WalkThroughWidget(
          express_buy_logo,
          "Buy food and other products or items inside our favorite in-app merchant partners.",
          "EXPRESS BUY"),
      WalkThroughWidget(
          express_pay_logo,
          "Pay all your monthly bills without leaving your home.",
          "EXPRESS PAY"),
      WalkThroughWidget(
          express_exchange_logo,
          "Buy. Save. Invest. Crypto. Use either your VIPCO currency or even your earned points to exchange cryptocurrency.",
          "EXPRESS EXCHANGE"),
      WalkThroughWidget(
          express_play_logo,
          "Enjoy playing games as you earn VIPCo currency. Exciting leisure and strategic gaming at your fingertips soon inside your VIPCo app.",
          "EXPRESS PLAY"),
    ];
    setState(() {});
  }

  @override
  void dispose() {
    //pageController?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            PageView(
                controller: pageController,
                children: pages.map((e) => e).toList()),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Skip".toUpperCase(),
                style: primaryTextStyle(size: 16, color: primary_color),
                textAlign: TextAlign.end,
              ).onTap(() {
                // GSDashboardScreen().launch(context);
              }),
            ).paddingOnly(right: 16, top: 16),
            Positioned(
              //  top: context.height() * 0.73,
              bottom: 80,
              left: 0,
              right: 0,
              child: DotIndicator(
                  pageController: pageController,
                  pages: pages,
                  indicatorColor: primary_color,
                  unselectedIndicatorColor: grey),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: appButton(
                context,
                'Next',
                () {
                  if (currentPage == 7) {
                    finish(context);
                    SignInScreen().launch(context, isNewTask: true);
                  } else {
                    pageController.nextPage(
                        duration: _kDuration, curve: _kCurve);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
