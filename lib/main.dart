
import 'package:flutter/material.dart';
import 'package:plant/constant.dart';
import 'package:plant/page/home/HomeScreen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Plant App",
      theme: ThemeData(
        scaffoldBackgroundColor: kBackGroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}


