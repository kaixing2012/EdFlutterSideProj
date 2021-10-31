import 'package:flutter/material.dart';
import 'package:project/featured/home/widgets/home.widget.dart';
import 'package:project/featured/home/widgets/profile.widget.dart';
import 'package:project/featured/home/widgets/playground.widget.dart';
import 'package:project/shared/bases/base_widget.state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseWidgetState<HomePage> {
  static int _selectedTap = 1;

  PageController _pageCtrl = PageController(
    initialPage: _selectedTap,
  );

  List<Widget> _tapWidgets = <Widget>[
    ProfileWidget(),
    HomeWidget(),
    PlaygroundWidget(),
  ];

  void _onPageChanged(int index) {
    setState(
      () {
        _selectedTap = index;
      },
    );
  }

  void _onTap(int index) {
    print('Home tap is on ${_tapWidgets[index]}');
    this._pageCtrl.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: PageView(
        controller: this._pageCtrl,
        children: this._tapWidgets,
        onPageChanged: this._onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedTap,
        onTap: this._onTap,
        items: [
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
              color: Colors.blueGrey[400],
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.blueGrey[100],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: Colors.blueGrey[400],
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.blueGrey[100],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Playground',
            icon: Icon(
              Icons.play_circle,
              color: Colors.blueGrey[400],
            ),
            activeIcon: Icon(
              Icons.play_circle,
              color: Colors.blueGrey[100],
            ),
          ),
        ],
      ),
    );
  }
}