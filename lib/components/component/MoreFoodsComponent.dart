import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/FoodDetailsScreen.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class MoreFoodsComponent extends StatefulWidget {
  static String tag = '/FDMoreFoodsComponent';

  @override
  MoreFoodsComponentState createState() => MoreFoodsComponentState();
}

class MoreFoodsComponentState extends State<MoreFoodsComponent> {
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
      height: 100,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
        itemCount: popularItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          PopularItemModel mData = popularItems[index];
          return Container(
            decoration: boxDecorationRoundedWithShadow(8),
            padding: EdgeInsets.all(8),
            width: 160,
            child: Row(
              children: [
                Image.asset(mData.image!).expand(),
                4.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mData.name!,
                        style: boldTextStyle(), softWrap: true, maxLines: 1),
                    Text('\$${mData.price}', style: secondaryTextStyle()),
                  ],
                ).expand(),
              ],
            ),
          ).paddingRight(16).onTap(() {
            FoodDetailsScreen(data: mData).launch(context);
          });
        },
      ),
    );
  }
}
