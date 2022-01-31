import 'package:flutter/material.dart';

class HSDeviceModel {
  String? deviceIcon;
  String? deviceName;
  String? status;
  bool? isOn = false;
  bool? isFav = false;
  int? deviceId;

  HSDeviceModel(
      {this.deviceIcon,
      this.deviceName,
      this.status,
      this.isOn,
      this.isFav,
      this.deviceId});
}

class HsBrightnessModel {
  Color? color;

  HsBrightnessModel({this.color});
}

class HSRoomListModel {
  String? roomName;
  String? status;
  bool? isOn = false;

  HSRoomListModel({this.roomName, this.status, this.isOn});
}

class HSUserProfileModel {
  String? image;
  String? name;

  HSUserProfileModel({this.image, this.name});
}

class HSNewSceneModel {
  String? deviceName;
  String? device;
  bool? isOn = false;
  bool? isAdd = false;

  HSNewSceneModel({this.deviceName, this.device, this.isOn, this.isAdd});
}

class HomeItemModel {
  String? image;
  String? name;

  HomeItemModel({this.image, this.name});
}

class CategoriesItemModel {
  String? image;
  String? name;

  CategoriesItemModel({this.image, this.name});
}

class FavouriteStoreProductsModel {
  String? image;
  String? name;
  int? price;
  String? perPriceName;
  int? flag;
  bool? isCart;
  String? details;
  int? discount;
  bool? isFavourite;
  int? selectedQuantity;
  String? quantityPerPrice;

  FavouriteStoreProductsModel({
    this.image,
    this.name,
    this.price,
    this.perPriceName,
    this.flag,
    this.details,
    this.discount,
    this.isCart,
    this.isFavourite,
    this.selectedQuantity,
    this.quantityPerPrice,
  });
}

class AddressModel {
  String? name;
  var contactNo;
  String? addressName;
  String? address;

  AddressModel({this.name, this.contactNo, this.addressName, this.address});
}

class FavouriteStoreVoucherModel {
  String? image;
  String? description;
  String? date;
  Color? color;

  FavouriteStoreVoucherModel(
      {this.image, this.description, this.date, this.color});
}

class PopularItemModel {
  String? image;
  String? name;
  int? price;
  String? description;
  bool? isCart;
  bool? isFavourite;
  int? discount;
  int? salePrice;
  int? quantity;

  PopularItemModel(
      {this.image,
      this.name,
      this.price,
      this.description,
      this.isCart,
      this.isFavourite,
      this.discount,
      this.salePrice,
      this.quantity});
}

class CollectionsItemModel {
  String? image;
  String? name;

  CollectionsItemModel({this.image, this.name});
}
