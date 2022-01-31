import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/components/component/ChooseAmountComponent.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/ProductDetailsScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FavouriteStoreProductComponent extends StatefulWidget {
  static String tag = '/FDFavouriteStoreProductComponent';

  @override
  FavouriteStoreProductComponentState createState() =>
      FavouriteStoreProductComponentState();
}

class FavouriteStoreProductComponentState
    extends State<FavouriteStoreProductComponent> {
  List<FavouriteStoreProductsModel> productItems =
      getFavouriteStoreProductsItems();

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
    return ListView.builder(
      itemCount: productItems.length,
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      itemBuilder: (context, index) {
        FavouriteStoreProductsModel mData = productItems[index];
        return Container(
          decoration: boxDecorationRoundedWithShadow(8),
          child: Stack(
            children: [
              Row(
                children: [
                  Image.asset(mData.image!,
                          fit: BoxFit.fill, height: context.width() * 0.3)
                      .expand(flex: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text(mData.name!, style: primaryTextStyle()),
                      4.height,
                      Row(
                        children: [
                          Text('\$${mData.price.toString()}',
                              style: boldTextStyle()),
                          Text('/${mData.perPriceName}',
                              style: secondaryTextStyle(color: black)),
                        ],
                      ),
                      8.height,
                      AppButton(
                        text: mData.flag == 0
                            ? (mData.isCart! ? 'Remove Cart' : 'Add to Cart')
                            : 'Choose Amount',
                        onTap: mData.flag == 0
                            ? () {
                                setState(() {
                                  mData.isCart = !mData.isCart!;
                                });
                              }
                            : () {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  context: context,
                                  builder: (context) {
                                    return ChooseAmountComponent();
                                  },
                                );
                              },
                        textStyle: boldTextStyle(
                            color: mData.isCart! ? black : FDSelectedTextColor,
                            size: 14),
                        width: context.width(),
                        color: mData.isCart!
                            ? FDRedColor.withOpacity(0.2)
                            : FDSelectedTextColor.withOpacity(0.2),
                        padding: EdgeInsets.only(top: 0, bottom: 0),
                        elevation: 0,
                      ),
                      4.height,
                    ],
                  ).expand(flex: 3),
                ],
              ).paddingOnly(left: 8, right: 8),
              Positioned(
                right: 0,
                child: mData.isFavourite!
                    ? IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.red.withOpacity(0.5),
                        onPressed: () {
                          setState(() {
                            mData.isFavourite = !mData.isFavourite!;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.favorite_outline),
                        onPressed: () {
                          setState(() {
                            mData.isFavourite = !mData.isFavourite!;
                          });
                        },
                      ),
              ),
            ],
          ),
        ).paddingBottom(16).onTap(
          () {
            ProductDetailsScreen(data: mData).launch(context);
          },
        );
      },
    );
  }
}
