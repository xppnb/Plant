import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant/constant.dart';

class DetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImageAndIcons(size: size),
            TitleAndPrice(
              title: "Angelica",
              country: "Russia",
              price: 440,
            ),
            BuyAndDescription(size: size),
            SizedBox(
              height: kDefaultPadding,
            )
          ],
        ),
      ),
    );
  }
}

class BuyAndDescription extends StatelessWidget {
  const BuyAndDescription({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 84,
          width: size.width / 2,
          child: FlatButton(
            child: Text(
              "Buy Now",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
            color: kPrimaryColor,
            onPressed: () {},
          ),
        ),
        SizedBox(
            height: 84,
            width: size.width / 2,
            child: FlatButton(onPressed: () {}, child: Text("Description"))),
      ],
    );
  }
}

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.title,
    this.country,
    this.price,
  }) : super(key: key);
  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "$title\n",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: kTextColor, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: country,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w300))
              ]),
            ),
            Spacer(),
            Text(
              "\$$price",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 4),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding + 5,
                      top: kDefaultPadding),
                  child: IconButton(
                      icon: SvgPicture.asset("icons/back_arrow.svg"),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                Spacer(),
                IconCard(
                  icon: "icons/sun.svg",
                ),
                IconCard(
                  icon: "icons/icon_2.svg",
                ),
                IconCard(
                  icon: "icons/icon_3.svg",
                ),
                IconCard(
                  icon: "icons/icon_4.svg",
                ),
              ],
            )),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage("images/img.png"),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 60,
                        color: kPrimaryColor.withOpacity(0.29)),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key key,
    this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 62,
      width: 62,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 15),
                color: kPrimaryColor.withOpacity(0.22),
                blurRadius: 22),
            BoxShadow(
                offset: Offset(-15, -15), color: Colors.white, blurRadius: 20)
          ]),
      child: SvgPicture.asset(icon),
    );
  }
}
