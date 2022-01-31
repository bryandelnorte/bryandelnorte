import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class CollectionScreen extends StatefulWidget {
  static String tag = '/FDCollectionScreen';

  @override
  CollectionScreenState createState() => CollectionScreenState();
}

class CollectionScreenState extends State<CollectionScreen> {
  List<CollectionsItemModel> collectionList = getCollectionsItems();

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
    setStatusBarColor(FDPrimaryColor,
        statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          widAppBarWidget(elevation: 0, context: context, title: 'Collection')
              as PreferredSizeWidget?,
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: boxDecorationWithShadow(),
              child: TabBar(
                tabs: [
                  Tab(child: Text('Popular')),
                  Tab(child: Text('Hot deal')),
                  Tab(child: Text('Feature')),
                ],
                indicator: BoxDecoration(
                  color: FDSelectedTextColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                labelColor: FDSelectedTextColor,
                unselectedLabelColor: grey,
              ),
            ),
            TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return Image.network(
                      collectionList[index].image!,
                      width: context.width() * 0.8,
                      fit: BoxFit.fill,
                    )
                        .cornerRadiusWithClipRRect(8)
                        .paddingOnly(right: 16)
                        .onTap(() {
                      toast('${collectionList[index].name} Collection');
                    });
                  },
                  itemCount: collectionList.length,
                  scrollDirection: Axis.horizontal,
                ),
                Center(child: Text('Hot deal')),
                Center(child: Text('Feature')),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
