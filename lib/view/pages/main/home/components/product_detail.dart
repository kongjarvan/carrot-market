import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/product.dart';
import 'package:workspace/theme.dart';
import 'package:workspace/util/my_number_format.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: textTheme().bodyText1),
          SizedBox(height: 4.0),
          Text("${product.address}*${product.publishedAt}"),
          SizedBox(height: 4.0),
          Text(numberPriceFormat("${product.price}"), style: textTheme().headline2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildIcons(iconData: CupertinoIcons.chat_bubble_2, count: product.commentsCount),
              const SizedBox(width: 5),
              _buildIcons(iconData: CupertinoIcons.heart, count: product.heartCount),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcons({required IconData iconData, required int count}) {
    return Visibility(
      visible: count > 0,
      child: Row(
        children: [
          Icon(iconData),
          Text("${count}"),
        ],
      ),
    );
  }
}
