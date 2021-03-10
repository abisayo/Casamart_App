import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../size_config.dart';

class BlockCategoryTitle extends StatelessWidget {
  const BlockCategoryTitle({
    Key key, 
    this.text, 
    this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Blocks",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: KPrimaryColor,
              fontWeight: FontWeight.bold
            ),
          ),
          Text("See More"),
        ],
      ),
    );
  }
}
