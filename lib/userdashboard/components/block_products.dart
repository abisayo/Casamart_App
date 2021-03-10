import 'package:Casamart/models/product.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'block_category_title.dart';
import 'product_card.dart';

class BlockProducts extends StatelessWidget {
  const BlockProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlockCategoryTitle(
          text: "Blocks",
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) => ProductCard(
                  product: demoProducts[index],
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}