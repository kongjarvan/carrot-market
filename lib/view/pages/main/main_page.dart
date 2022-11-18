import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/view/pages/main/chatting/chatting_page.dart';
import 'package:workspace/view/pages/main/home/home_page.dart';
import 'package:workspace/view/pages/main/my_carrot/my_carrot_page.dart';
import 'package:workspace/view/pages/main/near_me/near_me_page.dart';
import 'package:workspace/view/pages/main/neighborhood_life/neighborhood_life_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildIndexedStack(),
    );
  }

  IndexedStack _buildIndexedStack() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        HomePage(),
        NeighborhoodLifePage(),
        NearMePage(),
        ChattingPage(),
        MyCarrotPage(),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(label: "홈", icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: "동네생활", icon: Icon(CupertinoIcons.chat_bubble)),
        BottomNavigationBarItem(label: "내근처", icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(label: "채팅", icon: Icon(CupertinoIcons.chat_bubble)),
        BottomNavigationBarItem(label: "나의당근", icon: Icon(CupertinoIcons.home)),
      ],
    );
  }
}
