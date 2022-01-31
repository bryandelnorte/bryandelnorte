import 'package:flutter/material.dart';
import 'package:vipco_mega_wallet/models/AppModel.dart';
import 'package:vipco_mega_wallet/utils/Colors.dart';
import 'package:vipco_mega_wallet/utils/Images.dart';
import 'package:nb_utils/nb_utils.dart';

List<HomeItemModel> getHomeItems() {
  List<HomeItemModel> homeItemList = [];
  homeItemList.add(HomeItemModel(image: FDHomeImage1, name: 'Foods'));
  homeItemList.add(HomeItemModel(image: FDHomeImage2, name: 'Fruits'));
  homeItemList.add(HomeItemModel(image: FDHomeImage3, name: 'Vegetables'));
  return homeItemList;
}

const express_earn_logo = 'images/products/express_earn_logo.png';
const express_buy_logo = 'images/products/express_buy_logo.png';
const express_exchange_logo = 'images/products/express_exchange_logo.png';
const express_order_logo = 'images/products/express_order_logo.png';
const express_pay_logo = 'images/products/express_pay_logo.png';
const express_play_logo = 'images/products/express_play_logo.png';
const express_receive_logo = 'images/products/express_receive_logo.png';
const express_send_logo = 'images/products/express_send_logo.png';

List<CategoriesItemModel> getCategoriesItems() {
  List<CategoriesItemModel> categoriesItemList = [];
  categoriesItemList
      .add(CategoriesItemModel(image: express_earn_logo, name: 'Earn'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_send_logo, name: 'Send'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_receive_logo, name: 'Receive'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_order_logo, name: 'Order'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_buy_logo, name: 'Buy'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_pay_logo, name: 'Pay'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_exchange_logo, name: 'Exchange'));
  categoriesItemList
      .add(CategoriesItemModel(image: express_play_logo, name: 'Play'));
  return categoriesItemList;
}

List<FavouriteStoreProductsModel> getFavouriteStoreProductsItems() {
  List<FavouriteStoreProductsModel> favouriteStoreProductItemList = [];
  favouriteStoreProductItemList.add(
    FavouriteStoreProductsModel(
        image: FDSpinachImage,
        name: 'Spinach',
        price: 3,
        perPriceName: 'kg',
        flag: 0,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '2 Kg',
        details:
            'Spinach (Spinacia oleracea) is a leafy green vegetable that originated in Persia.It belongs to the amaranth family and is related to beets and quinoa. What\'s more, it\'s considered very healthy, as it\'s loaded with nutrients and antioxidants.'),
  );
  favouriteStoreProductItemList.add(
    FavouriteStoreProductsModel(
        image: FDCarrotImage,
        name: 'Carrot',
        price: 3,
        perPriceName: 'pack',
        flag: 0,
        discount: 20,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The carrot (Daucus carota) is a root vegetable often claimed to be the perfect health food. It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits.'),
  );
  favouriteStoreProductItemList.add(
    FavouriteStoreProductsModel(
        image: FDCabbageImage,
        name: 'Cabbage',
        price: 3,
        perPriceName: 'pack',
        flag: 1,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The cabbage plant, Brassica oleracea, is an herbaceous annual or biennial vegetable in the family Brassicaceae grown for its edible head. ... The head of the cabbage is round and forms on a short thick stem. The leaves are thick and alternating with wavy or lobed edges and the roots are are fibrous and shallow.'),
  );
  favouriteStoreProductItemList.add(
    FavouriteStoreProductsModel(
        image: FDSpinachImage,
        name: 'Spinach',
        price: 3,
        perPriceName: 'kg',
        flag: 0,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '2 Kg',
        details:
            'Spinach (Spinacia oleracea) is a leafy green vegetable that originated in Persia.It belongs to the amaranth family and is related to beets and quinoa. What\'s more, it\'s considered very healthy, as it\'s loaded with nutrients and antioxidants.'),
  );
  favouriteStoreProductItemList.add(
    FavouriteStoreProductsModel(
        image: FDCarrotImage,
        name: 'Carrot',
        price: 3,
        perPriceName: 'pack',
        flag: 0,
        discount: 20,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The carrot (Daucus carota) is a root vegetable often claimed to be the perfect health food. It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits.'),
  );
  favouriteStoreProductItemList.add(
    FavouriteStoreProductsModel(
        image: FDCabbageImage,
        name: 'Cabbage',
        price: 3,
        perPriceName: 'pack',
        flag: 1,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The cabbage plant, Brassica oleracea, is an herbaceous annual or biennial vegetable in the family Brassicaceae grown for its edible head. ... The head of the cabbage is round and forms on a short thick stem. The leaves are thick and alternating with wavy or lobed edges and the roots are are fibrous and shallow.'),
  );
  return favouriteStoreProductItemList;
}

List<AddressModel> getAddress() {
  List<AddressModel> addressList = [];
  addressList.add(
    AddressModel(
        name: 'Marshall Erikson',
        contactNo: '+349867345627',
        addressName: 'Home',
        address: '204, Shivam Appartment, MI 48423'),
  );
  addressList.add(
    AddressModel(
        name: 'Marshall Erikson',
        contactNo: '+349867345627',
        addressName: 'Company',
        address: '204, Shivam Appartment, MI 48423'),
  );
  return addressList;
}

List<PopularItemModel> getPopularItems() {
  List<PopularItemModel> popularItemList = [];
  popularItemList.add(
    PopularItemModel(
        image: FDRiceImage,
        name: 'Rice',
        price: 20,
        isCart: false,
        isFavourite: false,
        discount: 20,
        salePrice: 15,
        quantity: 2,
        description:
            'Rice, (Oryza sativa), edible starchy cereal grain and the grass plant (family Poaceae) by which it is produced. ... Rice is cooked by boiling, or it can be ground into a flour. It is eaten alone and in a great variety of soups, side dishes, and main dishes in Asian, Middle Eastern, and many other cuisines.'),
  );
  popularItemList.add(
    PopularItemModel(
        image: FDNoodlesImage,
        name: 'Noodles',
        price: 30,
        isCart: false,
        isFavourite: true,
        quantity: 1,
        description:
            'Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. ... Noodles are usually cooked in boiling water, sometimes with cooking oil or salt added.'),
  );
  popularItemList.add(
    PopularItemModel(
        image: FDPanirImage,
        name: 'Paneer',
        price: 50,
        isCart: false,
        isFavourite: false,
        quantity: 2,
        description:
            'Paneer (pronounced [pəniːr]) or Indian cottage cheese is a fresh cheese common in the Indian subcontinent (India, Pakistan, Bangladesh) made from cow or buffalo milk. It is a non-aged, non-melting soft cheese made by curdling milk with a fruit- or vegetable-derived acid, such as lemon juice.'),
  );
  popularItemList.add(PopularItemModel(
    name: 'Snacks',
    image: FDSnackImage,
    price: 3,
    isFavourite: true,
    isCart: false,
    quantity: 3,
    description:
        'A snack is a small portion of food generally eaten between meals. Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home. ... Snack foods are typically designed to be portable, quick, and satisfying.',
  ));
  popularItemList.add(PopularItemModel(
    name: 'Hamburger',
    image: FDHamburgerImage,
    price: 6,
    isFavourite: false,
    isCart: false,
    quantity: 1,
    description:
        'A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... A hamburger topped with cheese is called a cheeseburger.',
  ));
  popularItemList.add(PopularItemModel(
    name: 'Pizza',
    image: FDPizzaImage,
    price: 9,
    isFavourite: true,
    isCart: false,
    quantity: 1,
    description:
        'Pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ...',
  ));
  popularItemList.add(PopularItemModel(
    name: 'Beef Noodle',
    image: FDBeefNoodleImage,
    price: 5,
    isFavourite: true,
    isCart: false,
    quantity: 3,
    description:
        'Beef noodle soup is a noodle soup made of stewed or red braised beef, beef broth, vegetables and Chinese noodles. It exists in various forms throughout East and Southeast Asia. ... Beef noodles are often served with suan cai (Chinese sauerkraut) on top, green onion and sometimes other vegetables in the soup as well.',
  ));
  popularItemList.add(
    PopularItemModel(
      image: FDDriedFoodImage,
      name: 'Dried Foods',
      price: 20,
      salePrice: 17,
      discount: 20,
      isFavourite: false,
      isCart: false,
      quantity: 3,
      description:
          'Drying is the world\'s oldest and most common method of food preservation. Drying technology is both simple and readily available to most of the world\'s culture. Examples of dried foods are jerky, powdered milk, dried beans and peas, potatoes in a box, dried fruits and vegetables, pasta, and rice.',
    ),
  );
  return popularItemList;
}

List<CollectionsItemModel> getCollectionsItems() {
  List<CollectionsItemModel> collectionsItemList = [];
  collectionsItemList.add(CollectionsItemModel(
      image: FDSuperDealCollectionImage, name: 'Super Deal'));
  collectionsItemList.add(CollectionsItemModel(
      image: FDFriendShipCollectionImage, name: 'Friendship'));
  collectionsItemList.add(CollectionsItemModel(
      image: FDSuperDealCollectionImage, name: 'Super Deal'));
  collectionsItemList.add(CollectionsItemModel(
      image: FDFriendShipCollectionImage, name: 'Friendship'));
  return collectionsItemList;
}
