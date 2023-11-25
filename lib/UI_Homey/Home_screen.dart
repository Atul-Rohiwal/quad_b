import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quad_b/UI_Homey/App-Bar.dart';
import 'package:quad_b/UI_Homey/Search.dart';
import 'package:quad_b/UI_Homey/Cart.dart';
import 'package:quad_b/UI_Homey/Profile.dart';
import 'package:quad_b/BLoC/Bottom_nav_Bar.dart';
import 'package:icons_plus/icons_plus.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    TvShowList(),
    Profile(),
    Search(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:Apbar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black,
        currentIndex: _currentIndex,

        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_menu,color: Colors.white,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_detail,color: Colors.white,),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(BoxIcons.bx_face,color: Colors.white,),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.white,

      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

