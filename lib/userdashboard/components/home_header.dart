import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'icon_with_btn_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SearchField(),
          IconBtnWithCounter(
            icon: Icon(Icons.shopping_cart_rounded),
            press: () {},
          ),
          IconBtnWithCounter(
            icon: Icon(Icons.add_alert),
            numOfItems: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}