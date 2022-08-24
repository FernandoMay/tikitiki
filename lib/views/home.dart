import 'package:flutter/cupertino.dart';
import 'package:tikitiki/views/addvideoview.dart';
import 'package:tikitiki/constants.dart';
import 'package:tikitiki/views/profileview.dart';
import 'package:tikitiki/views/seacrhview.dart';
import 'package:tikitiki/views/videoview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIdx = 0;

  List pages = [
    VideoView(),
    SearchView(),
    const NewVideo(),
    const Text('Messages Screen'),
    Profile(uid: authController.user.uid),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        // type: BottomNavigationBarType.fixed,
        backgroundColor: bgColor,
        activeColor: CupertinoColors.systemPink,
        inactiveColor: CupertinoColors.inactiveGray,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble, size: 30),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, size: 30),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(child: pages[pageIdx]);
          },
        );
      },
    );
  }
}
