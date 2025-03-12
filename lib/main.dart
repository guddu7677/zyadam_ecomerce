import 'package:flutter/material.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/catogery.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_account.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottombar.dart';
import 'package:zyadam_ecomere/drawer/filter.dart';
import 'package:zyadam_ecomere/drawer/short_by.dart';
import 'package:zyadam_ecomere/pages/Add_card.dart';
import 'package:zyadam_ecomere/pages/create_ac.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/first_home_page.dart';
import 'package:zyadam_ecomere/pages/home_page.dart';
import 'package:zyadam_ecomere/pages/login.dart';
import 'package:zyadam_ecomere/pages/login_signup.dart';
import 'package:zyadam_ecomere/pages/login_with_otp.dart';
import 'package:zyadam_ecomere/pages/otp.dart';
import 'package:zyadam_ecomere/tabBar/all.dart';

void main() {
  runApp(zydam());
}

class zydam extends StatelessWidget {
  const zydam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Category_page(),
      routes: {
        "/home_page": (context) => home_page(),
        "/login_signup": (context) => login_signup(),
        "/login_page": (context) => login_page(),
        "/create_account": (context) => create_account(),
        "/First_homePage": (context) => First_homePage(),
        "/Bottombar": (context) => Bottombar(),
        "/Category_page": (context) => Category_page(),
        "/My_Account": (context) => My_Account(),
        "/AddCard": (context) => AddCard(),
        "/All_tab": (context) => All_tab(),
        "/Login_with_otp": (context) => Login_with_otp(),
        "/Otp_page": (context) => Otp_page(),
        "/filter_page": (context) => filter_page(),
        "/short_by": (context) => short_by(),
      },
    );
  }
}
