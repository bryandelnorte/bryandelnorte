import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryMenuScreen extends StatefulWidget {
  @override
  CategoryMenuScreenState createState() => CategoryMenuScreenState();
}

class CategoryMenuScreenState extends State<CategoryMenuScreen> {
  List<String> categoryIconList = [
    express_earn_logo,
    express_buy_logo,
    express_exchange_logo,
    express_order_logo,
    express_pay_logo,
    express_play_logo,
    express_receive_logo,
    express_send_logo,
  ];
  List<String> categoryNameList = [
    'Earn',
    'Buy',
    'Exchange',
    'Order',
    'Pay',
    'Play',
    'Receive',
    'Send'
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
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List.generate(
          categoryIconList.length,
          (index) {
            return Container(
              margin: EdgeInsets.all(8),
              width: context.width() * 0.18,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: boxDecorationWithRoundedCorners(
                      border:
                          Border.all(color: gray.withOpacity(0.7), width: 0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: commonCacheImageWidget(categoryIconList[index], 40,
                        fit: BoxFit.cover),
                  ),
                  8.height,
                  Text(categoryNameList[index], style: secondaryTextStyle()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
