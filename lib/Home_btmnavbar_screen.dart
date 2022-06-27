// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:wefiwebu_2/screens/Marketplace_screen.dart';
import 'package:wefiwebu_2/screens/Addlostitem_screen.dart';
import 'package:wefiwebu_2/screens/chat_screen.dart';
import 'package:wefiwebu_2/screens/home_screen.dart';
import 'package:wefiwebu_2/screens/message_screen.dart';
import 'package:wefiwebu_2/screens/profile_screen.dart';

import 'model/user_model.dart';

class HomeBtmNavbar extends StatefulWidget {
  const HomeBtmNavbar({super.key});

  @override
  State<HomeBtmNavbar> createState() => _HomeBtmNavbarState();
}

class _HomeBtmNavbarState extends State<HomeBtmNavbar> {
  int selectindex = 0;

  static final List<Widget> _screens = <Widget>[
    HomeScreen(),
    Marketplace_Screen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(selectindex),
      ),

      //bottom nav bar
      bottomNavigationBar: Container(
        color: Colors.grey.shade400,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            tabBackgroundColor: Colors.grey.shade200,
            hoverColor: Colors.grey.shade100,
            gap: 3,
            color: Colors.black,
            activeColor: Colors.pinkAccent.shade400,
            duration: Duration(milliseconds: 300),
            backgroundColor: Colors.grey.shade400,
            padding: EdgeInsets.all(4),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.store,
                text: 'Marketplace',
              ),
              // GButton(icon: Icons.add_circle_rounded, text: 'Add'),
              GButton(
                icon: Icons.message_sharp,
                text: 'Message',
              ),
              GButton(
                icon: Icons.account_circle_rounded,
                text: 'Profile',
              ),
            ],
            selectedIndex: selectindex,
            onTabChange: (index) {
              setState(() {
                selectindex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
