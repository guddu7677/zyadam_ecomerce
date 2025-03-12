import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure to import 'get' package for GetX functionality
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/catogery.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/first_home_page.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_account.dart';
import 'package:zyadam_ecomere/bottom_nav_bar/bottom_nav_page/my_cart.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController()); // Get controller
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectIndex.value,
            onDestinationSelected: (index) {
              controller.selectIndex.value = index; // Update selected index
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: "Category",
              ),
              NavigationDestination(
                icon: Icon(Icons.card_giftcard_outlined),
                label: "My Card",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "My Account",
              ),
            ],
          ),
        ),
        body: Obx(
          () => controller.screen[controller.selectIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectIndex = 0.obs; // Use .obs to make the value reactive
  // List of screens that correspond to the bottom navigation index
  final List<Widget> screen = [
    First_homePage(),
    Category_page(),
    My_Cart(),
    My_Account(),
  ];
}
