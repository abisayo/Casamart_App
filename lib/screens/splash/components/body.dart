import 'package:Casamart/constants.dart';
import 'package:Casamart/screens/splash/components/splash_content.dart';
import 'package:Casamart/login/login_screen.dart';
import 'package:Casamart/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Casamart.",
      "text2": "Your No 1 Building material Plug in Nigeria",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "You can shop any Building Material of your Choice.",
      "text2": "At the best price and 100% Quality",
      "image": "assets/images/splash_2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                  text2: splashData[index]["text2"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: InkWell(
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: KPrimaryColor,
                            onPressed: () {
                              changeScreen(context, Login());
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: KPrimaryLightColor
                              ),
                            )),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: KAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? KPrimaryColor : KPrimaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
