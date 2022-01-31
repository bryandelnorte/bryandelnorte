import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class CollectionListComponent extends StatefulWidget {
  static String tag = '/FDCollectionListComponent';

  @override
  CollectionListComponentState createState() => CollectionListComponentState();
}

class CollectionListComponentState extends State<CollectionListComponent> {
  List<CollectionsItemModel> collectionItems = getCollectionsItems();

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
      height: 220,
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: collectionItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 2),
            width: 150,
            decoration: boxDecorationRoundedWithShadow(8),
            child: Column(
              children: [
                commonCacheImageWidget(
                  collectionItems[index].image!,
                  150,
                  width: context.width(),
                  fit: BoxFit.fill,
                ),
                8.height,
                Text(collectionItems[index].name!,
                    style: primaryTextStyle(),
                    maxLines: 1,
                    textAlign: TextAlign.center),
              ],
            ),
          ).onTap(() {
            toast('${collectionItems[index].name} Collection');
          });
        },
        separatorBuilder: (context, index) {
          return 16.width;
        },
      ),
    );
  }
}
