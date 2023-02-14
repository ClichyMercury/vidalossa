import 'package:flutter/material.dart';

import 'categoryModal.dart';

const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;

const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: kPrimaryColor,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

final labels = [
  'Notifications',
  'Payments',
  'Message',
  'My Orders',
  'Setting Account',
  'Call Center',
  'About Application',
];

final icons = [
  Icons.notifications,
  Icons.payment,
  Icons.message,
  Icons.local_dining,
  Icons.settings,
  Icons.person,
  Icons.info,
];

final categoryList = [
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2018/01/25/08/14/beverages-3105631_1280.jpg",
    category: "WallMart",
    discount: 10,
  ),
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2015/10/20/18/57/furniture-998265__480.jpg",
    category: "Houses",
    discount: 10,
  ),
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2014/03/22/22/17/phone-292994__480.jpg",
    category: "Phones",
    discount: 10,
  ),
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2016/11/29/03/42/mic-1867121_1280.jpg",
    category: "Electronics",
    discount: 10,
  ),
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2017/07/16/22/22/bath-oil-2510783__480.jpg",
    category: "Beauty",
    discount: 10,
  ),
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2018/05/12/06/06/onesie-3392524__480.jpg",
    category: "Baby articles",
    discount: 10,
  ),
  CategoryModal(
    image:
        "https://cdn.pixabay.com/photo/2014/07/06/17/20/tractor-385681__480.jpg",
    category: "farmers",
    discount: 10,
  ),
  CategoryModal(
    image:
        'https://cdn.pixabay.com/photo/2016/08/18/12/20/xbox-1602822__480.jpg',
    category: "Video Game",
    discount: 10,
  ),
  CategoryModal(
    image:
        'https://cdn.pixabay.com/photo/2016/11/29/09/41/bag-1868758__480.jpg',
    category: "Men Style",
    discount: 10,
  ),
  CategoryModal(
    image:
        'https://cdn.pixabay.com/photo/2017/08/05/00/12/girl-2581913__480.jpg',
    category: "Women Style",
    discount: 10,
  ),
  CategoryModal(
    image:
        'https://cdn.pixabay.com/photo/2020/07/06/07/11/baseball-5375817__480.jpg',
    category: "Sport Articles",
    discount: 10,
  ),
  CategoryModal(
    image:
        'https://cdn.pixabay.com/photo/2016/03/11/02/08/speedometer-1249610__480.jpg',
    category: "Car articles",
    discount: 10,
  ),
];
