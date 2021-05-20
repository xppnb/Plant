import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant/constant.dart';

import 'HomeBody.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              icon: SvgPicture.asset("icons/menu.svg"), onPressed: () {})),
      body: HomeBody(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: kDefaultPadding * 2, right: kDefaultPadding * 2),
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: kPrimaryColor.withOpacity(0.38),
          blurRadius: 35,
          offset: Offset(0, -10),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: SvgPicture.asset("icons/flower.svg"), onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset("icons/heart-icon.svg"), onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset("icons/user-icon.svg"), onPressed: () {}),
        ],
      ),
    );
  }
}
