import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/AddressScreen.dart';
import 'package:vipco_mega_wallet/components/dashboard/ProductDetailsScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class MyCartScreen extends StatefulWidget {
  static String tag = '/FDMyCartScreen';

  @override
  MyCartScreenState createState() => MyCartScreenState();
}

class MyCartScreenState extends State<MyCartScreen> {
  List<FavouriteStoreProductsModel> myCartItems =
      getFavouriteStoreProductsItems();

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
    setStatusBarColor(Colors.transparent,
        statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widAppBarWidget(context: context, title: 'My cart', elevation: 4)
          as PreferredSizeWidget?,
      body: SingleChildScrollView(
        child: Column(
          children: [
            8.height,
            ListTile(
              leading: Container(
                child: Icon(Icons.location_on, size: 20, color: black),
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: grey.withOpacity(0.2)),
              ),
              title: Text('204 Foxrun St.Davison, MI 48423',
                  maxLines: 1, style: secondaryTextStyle(color: black)),
              trailing: Icon(Icons.navigate_next, color: FDSelectedTextColor)
                  .onTap(() {
                AddressScreen().launch(context);
              }),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16, top: 16, right: 16),
              physics: ScrollPhysics(),
              itemCount: myCartItems.length,
              itemBuilder: (context, index) {
                FavouriteStoreProductsModel mData = myCartItems[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            mData.image!,
                            height: context.width() * 0.25,
                            fit: BoxFit.cover,
                          ).expand(flex: 2),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${mData.name}(${mData.quantityPerPrice})',
                                  style: primaryTextStyle(size: 14)),
                              8.height,
                              Row(
                                children: [
                                  Container(
                                    child: Text('-').paddingOnly(
                                        left: 10, right: 10, top: 4, bottom: 4),
                                    decoration: boxDecorationWithRoundedCorners(
                                      backgroundColor: grey.withOpacity(0.1),
                                    ),
                                  ).onTap(() {
                                    setState(() {
                                      if (mData.selectedQuantity! > 1) {
                                        mData.selectedQuantity =
                                            mData.selectedQuantity! - 1;
                                      }
                                    });
                                  }),
                                  16.width,
                                  Text(mData.selectedQuantity.toString(),
                                      style: secondaryTextStyle(color: black)),
                                  16.width,
                                  Container(
                                    child: Text('+').paddingOnly(
                                        left: 10, right: 10, top: 4, bottom: 4),
                                    decoration: boxDecorationWithRoundedCorners(
                                      backgroundColor: grey.withOpacity(0.1),
                                    ),
                                  ).onTap(() {
                                    setState(() {
                                      mData.selectedQuantity =
                                          mData.selectedQuantity! + 1;
                                    });
                                  }),
                                ],
                              ),
                              8.height,
                              Text('\$${mData.price}', style: boldTextStyle()),
                            ],
                          ).expand(flex: 3),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(
                          Icons.close,
                          color: grey,
                        ).onTap(() {
                          setState(() {
                            myCartItems.remove(mData);
                          });
                        }),
                      ),
                    ],
                  ),
                ).paddingBottom(16).onTap(() {
                  ProductDetailsScreen(data: myCartItems[index])
                      .launch(context);
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: boxDecorationWithShadow(),
        padding: EdgeInsets.all(16),
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Voucher', style: primaryTextStyle(size: 14)),
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: grey.withOpacity(0.1)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text('Discount \$2.00', style: boldTextStyle(size: 14)),
                      Icon(Icons.navigate_next, color: FDSelectedTextColor),
                    ],
                  ),
                ),
              ],
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total (Inc Shipping fee)',
                        style: primaryTextStyle(size: 14)),
                    Text('\$190.00', style: boldTextStyle()),
                  ],
                ),
                AppButton(
                  elevation: 0,
                  color: FDPrimaryColor,
                  text: 'Check out',
                  textStyle: primaryTextStyle(color: white),
                  padding: EdgeInsets.only(left: 26, right: 26),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
