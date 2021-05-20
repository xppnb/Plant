import 'package:flutter/material.dart';
import 'package:plant/page/details/details_screen.dart';

const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackGroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

///Users/xupeng/gitbub/Plant-App-Flutter-UI-master/assets/images/logo.png
Future buildPush(BuildContext context) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return DetailsScreen();
  }));
}
