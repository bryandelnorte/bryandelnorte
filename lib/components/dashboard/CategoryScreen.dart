import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/CategoryDetailScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Constants.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryScreen extends StatefulWidget {
  static String tag = '/FDCategoryScreen';
  final bool isCategoryFromHome;

  CategoryScreen({this.isCategoryFromHome = false});

  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  List<CategoriesItemModel> categoriesItems = getCategoriesItems();

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
    if (widget.isCategoryFromHome) {
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
      appBar: widAppBarWidget(context: context, title: 'Categories')
          as PreferredSizeWidget?,
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(categoriesItems.length, (index) {
            return Container(
              width: (context.width() - (4 * 16)) * 0.33,
              child: Column(
                children: [
                  Container(
                    child: Image.asset(categoriesItems[index].image!)
                        .paddingAll(16),
                    decoration: boxDecorationRoundedWithShadow(8),
                  ),
                  8.height,
                  Text(
                    categoriesItems[index].name!,
                    style: primaryTextStyle(size: headingFontSize),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ).onTap(() {
              CategoryDetailScreen(categoryName: categoriesItems[index].name)
                  .launch(context);
            });
          }),
        ).paddingAll(16),
      ),
    );
  }
}
