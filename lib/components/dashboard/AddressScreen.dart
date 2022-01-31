import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/components/dashboard/AddNewAddressScreen.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/DataProviders.dart';
import 'package:vipco_mega_wallet/utils/Widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class AddressScreen extends StatefulWidget {
  static String tag = '/FDAddressScreen';
  final bool isFromAccount;

  AddressScreen({this.isFromAccount = false});

  @override
  AddressScreenState createState() => AddressScreenState();
}

class AddressScreenState extends State<AddressScreen> {
  List<AddressModel> addressList = getAddress();

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
    if (widget.isFromAccount) {
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
      appBar: widAppBarWidget(title: 'My Address', context: context)
          as PreferredSizeWidget?,
      body: ListView.builder(
        itemCount: addressList.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: boxDecorationRoundedWithShadow(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Icon(addressList[index].addressName == 'Company'
                          ? Icons.home_work_rounded
                          : Icons.home)
                      .paddingAll(8),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressList[index].addressName!,
                        style: boldTextStyle()),
                    Text(addressList[index].contactNo,
                        style: secondaryTextStyle()),
                    Text(
                      addressList[index].address!,
                      style: secondaryTextStyle(),
                      maxLines: 2,
                    ),
                    8.height,
                    Text(addressList[index].name!, style: boldTextStyle()),
                  ],
                ),
              ],
            ),
          ).paddingOnly(bottom: 16);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: AppButton(
          elevation: 0,
          width: context.width(),
          color: FDSelectedTextColor.withOpacity(0.2),
          textStyle: boldTextStyle(color: FDSelectedTextColor),
          text: 'Add New Address',
          onTap: () {
            AddNewAddressScreen().launch(context);
          },
        ),
      ),
    );
  }
}
