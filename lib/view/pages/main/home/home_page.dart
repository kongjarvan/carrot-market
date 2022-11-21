import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/product.dart';
import 'package:workspace/view/pages/main/home/components/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) => ProductItem(productList[index]),
        separatorBuilder: (context, index) => Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.grey,
        ),
        itemCount: productList.length,
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        Text("좌동"),
        SizedBox(width: 4.0),
        Icon(
          CupertinoIcons.chevron_down,
          size: 15,
        ),
      ],
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
      IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.list_dash)),
      IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0.5),
      child: Divider(
        thickness: 0.5,
        color: Colors.grey,
      ),
    ),
  );
}
