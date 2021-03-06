import 'package:flutter/material.dart';
// import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDAccountScreen.dart';
// import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFavoriteScreen.dart';
import 'package:vipco_mega_wallet/components/dashboard/HomeScreen.dart';
// import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMarketScreen.dart';
// import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyOrderScreen.dart';
import 'package:vipco_mega_wallet/components/widgets/BubbleBottomBar.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:nb_utils/nb_utils.dart';

class DashBoardScreen extends StatefulWidget {
  static String tag = '/DashBoardScreen';

  final bool isFromSignIn;

  DashBoardScreen({this.isFromSignIn = false});

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    // FDMyOrderScreen(),
    // FDFavoriteScreen(),
    // FDMarketScreen(),
    // FDAccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    if (widget.isFromSignIn) {
      setStatusBarColor(FDPrimaryColor,
          statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void setStatusColor() {
    if (selectedIndex == 1 || selectedIndex == 2 || selectedIndex == 3) {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    } else {
      setStatusBarColor(FDPrimaryColor,
          statusBarIconBrightness: Brightness.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setStatusColor();
          if (value == 0) {
            setState(() {});
          }
        },
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: FDPrimaryColor,
            icon: Icon(Icons.home, color: grey),
            activeIcon: Icon(Icons.home, color: FDPrimaryColor),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
            backgroundColor: FDPrimaryColor,
            icon: ImageIcon(AssetImage(FDOrderIcon), color: grey),
            activeIcon:
                ImageIcon(AssetImage(FDOrderIcon), color: FDPrimaryColor),
            title: Text("Order"),
          ),
          BubbleBottomBarItem(
            backgroundColor: FDPrimaryColor,
            icon: Icon(Icons.favorite, color: grey),
            activeIcon: Icon(Icons.favorite, color: FDPrimaryColor),
            title: Text("Favorite"),
          ),
          BubbleBottomBarItem(
            backgroundColor: FDPrimaryColor,
            icon: ImageIcon(AssetImage(FDMarketIcon), color: grey),
            activeIcon:
                ImageIcon(AssetImage(FDMarketIcon), color: FDPrimaryColor),
            title: Text("Market"),
          ),
          BubbleBottomBarItem(
            backgroundColor: FDPrimaryColor,
            icon: Icon(Icons.person, color: grey),
            activeIcon: Icon(Icons.person, color: FDPrimaryColor),
            title: Text("Account"),
          ),
        ],
      ),
    );
  }
}
