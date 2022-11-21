import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/models/neighborhood_life.dart';
import 'package:workspace/theme.dart';
import 'package:workspace/view/pages/main/neighborhood_life/component/neighborhood_body.dart';
import 'package:workspace/view/pages/main/neighborhood_life/component/neighborhood_header.dart';

class NeighborhoodLifePage extends StatelessWidget {
  const NeighborhoodLifePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동네생활'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle)),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
        ],
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          NeighborhoodHeader(),
          SizedBox(height: 16, child: Container(color: Colors.grey[200])),
          ...List.generate(
            neighborhoodLifeList.length,
            (index) => NeighborhoodBody(neighborhoodLife: neighborhoodLifeList[index]),
          ),
        ],
      ),
    );
  }
}
