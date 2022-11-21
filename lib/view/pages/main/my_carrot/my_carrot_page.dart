import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workspace/theme.dart';

class MyCarrotPage extends StatelessWidget {
  const MyCarrotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _userProfile(),
                _rowMenu(),
              ],
            ),
          ),
          SizedBox(child: Container(height: 16, color: Colors.grey[200])),
        ],
      ),
    );
  }

  Padding _rowMenu() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent[100],
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 60,
                height: 60,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.list,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('판매내역', style: textTheme().bodyText1)
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent[100],
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 60,
                height: 60,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.bagShopping,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('구매내역', style: textTheme().bodyText1)
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent[100],
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 60,
                height: 60,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('관심목록', style: textTheme().bodyText1)
            ],
          ),
        ],
      ),
    );
  }

  Widget _userProfile() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  imageUrl: 'https://placeimg.com/200/100/people/grayscale',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  Text('developer', style: textTheme().headline2),
                  Text('좌동 #00912', style: textTheme().bodyText2),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                '프로필 보기',
                style: textTheme().bodyText1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
