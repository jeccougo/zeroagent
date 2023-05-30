
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/account/accountpage.dart';
import '../screens/homepage/homescreen.dart';
import '../screens/messages/chatpage.dart';
import '../screens/saved/saved properties.dart';


class MainPage extends StatefulWidget {

  MainPage({Key? key,}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _tap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    ChatPage(),
    SavedPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: (
          _pages[_selectedIndex]
      ),
      bottomNavigationBar: Container(
        color: Colors.blue.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: GNav(
            gap: 4,
            backgroundColor:  Colors.blue.shade900,
            tabBackgroundColor: Colors.black26,
            color: Colors.white,
            activeColor: Colors.white,
            onTabChange: _tap,
            padding: EdgeInsets.all(10),

            tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Chat',
                ),
                GButton(
                  icon: Icons.save,
                  text: 'Saved',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],


          ),
        ),
      ),



    );
  }
}


