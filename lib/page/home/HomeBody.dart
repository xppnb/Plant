import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant/constant.dart';
import 'package:plant/page/details/details_screen.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            title: "Recomended",
            press: () {},
          ),
          RecomendsPlants(),
          TitleWithMoreBtn(
            title: "Featured Plants",
            press: () {},
          ),
          FuturePlants(),
          SizedBox(
            height: kDefaultPadding,
          )
        ],
      ),
    );
  }
}

class FuturePlants extends StatelessWidget {
  const FuturePlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          FeaturePlantCard(
            image: "images/bottom_img_1.png",
            press: () {
              buildPush(context);
            },
          ),
          FeaturePlantCard(
            image: "images/bottom_img_2.png",
            press: () {
              buildPush(context);
            },
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
            left: kDefaultPadding),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          RecommendPlantCard(
            image: "images/image_1.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {
              buildPush(context);
            },
          ),
          RecommendPlantCard(
            image: "images/image_2.png",
            title: "Angelica",
            country: "Russia",
            price: 440,
            press: () {
              buildPush(context);
            },
          ),
          RecommendPlantCard(
            image: "images/image_3.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {
              buildPush(context);
            },
          ),
        ],
      ),
    );
  }


}


class RecommendPlantCard extends StatelessWidget {
  const RecommendPlantCard(
      {Key key, this.press, this.image, this.country, this.title, this.price})
      : super(key: key);

  final Function press;
  final title;
  final image;
  final int price;
  final country;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Container(
          width: size.width * 0.4,
          margin: EdgeInsets.only(
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding * 3,
              left: kDefaultPadding),
          child: Column(
            children: [
              Image.asset(image),
              Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button),
                      TextSpan(
                          text: country.toUpperCase(),
                          style:
                              TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                    ])),
                    Spacer(),
                    Text("\$${price}"),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({Key key, this.title, this.press}) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderLine(
            text: title,
          ),
          Spacer(),
          FlatButton(
            onPressed: press,
            child: Text(
              "More",
              style: TextStyle(color: Colors.white),
            ),
            color: kPrimaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key key,
    this.text,
  }) : super(
          key: key,
        );
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.4),
            ),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ],
      ),
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      margin: EdgeInsets.only(bottom: kDefaultPadding * 3.3),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding + 36,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36))),
            child: Row(
              children: [
                Text("Hi Uishopy!",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Spacer(),
                Image.asset("images/logo.png"),
              ],
            ),
          ),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.5))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle:
                            TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "icons/search.svg",
                  ),
                ],
              ),
            ),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ],
      ),
    );
  }
}
