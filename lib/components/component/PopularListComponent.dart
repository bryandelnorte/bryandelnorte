import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/FoodDetailsScreen.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class PopularListComponent extends StatefulWidget {
  static String tag = '/FDPopularListComponent';

  @override
  PopularListComponentState createState() => PopularListComponentState();
}

class PopularListComponentState extends State<PopularListComponent> {
  List<PopularItemModel> popularItems = getPopularItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, bottom: 16, top: 16),
        itemCount: popularItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 120,
            decoration: boxDecorationRoundedWithShadow(8),
            child: Column(
              children: [
                Image.asset(popularItems[index].image!, fit: BoxFit.cover)
                    .expand(),
                8.height,
                Text(
                  popularItems[index].name!,
                  style: primaryTextStyle(),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).onTap(() {
            FoodDetailsScreen(data: popularItems[index], isFoodFromHome: true)
                .launch(context);
          });
        },
      ),
    );
  }
}
