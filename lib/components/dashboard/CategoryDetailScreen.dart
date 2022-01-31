import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/components/component/FavouriteStoreProductComponent.dart';
import 'package:vipco_mega_wallet/components/dashboard/MyCartScreen.dart';
import 'package:vipco_mega_wallet/components/dashboard/SearchScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryDetailScreen extends StatefulWidget {
  static String tag = '/FDCategoryDetailScreen';

  final String? categoryName;
  final bool isFromHomePage;

  CategoryDetailScreen({this.categoryName, this.isFromHomePage = false});

  @override
  CategoryDetailScreenState createState() => CategoryDetailScreenState();
}

class CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    if (widget.isFromHomePage) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widAppBarWidget(
        title: widget.categoryName!,
        context: context,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              SearchScreen().launch(context);
            },
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: ImageIcon(AssetImage(FDMarketIcon)),
                onPressed: () {
                  MyCartScreen().launch(context);
                },
              ),
              Positioned(
                right: 6,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                  child: Text('1'),
                ),
              )
            ],
          ).center().paddingOnly(right: 16),
        ],
      ) as PreferredSizeWidget?,
      body: FavouriteStoreProductComponent(),
    );
  }
}
