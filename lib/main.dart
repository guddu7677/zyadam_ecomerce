import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/catogery.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_account.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_account/my_order.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_account/whishlist.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_cart.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottombar.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/order_page/order_summary.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/order_page/paymenrts.dart';
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
import 'package:zyadam_ecomere/tabBar/all_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env"); // Ensure correct file name
  } catch (e) {
    print("Error loading .env file: $e");
  }

  runApp(const zydam());
}

class zydam extends StatelessWidget {
  const zydam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login_page(),
      routes: {
        "/home_page": (context) => home_page(),
        "/login_signup": (context) => login_signup(),
        "/login_page": (context) => login_page(),
        "/CreateAccount": (context) => CreateAccount(),
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
        "/Wishlist": (context) => Wishlist(),
        "/My_order": (context) => My_order(),
        "/Order_Summary": (context) => Order_Summary(),
        "/Payments_page": (context) => Payments_page(),
        "/My_Cart": (context) => My_Cart(),
      },
    );
  }
}
