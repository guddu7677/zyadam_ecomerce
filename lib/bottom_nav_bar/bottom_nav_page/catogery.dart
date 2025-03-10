import 'package:flutter/material.dart';
import 'package:zyadam_ecomere/tabBar/all.dart';

class Category_page extends StatefulWidget {
  const Category_page({super.key});

  @override
  State<Category_page> createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: Center(
              child: Container(
                height: 56,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  showCursor: true, // Allows the cursor to show
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.camera_enhance),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: "All"),
                Tab(text: "Fruit"),
                Tab(text: "Vegetable"),
                Tab(text: "Exotic"),
              ],
            )),
        body: TabBarView(
          children: [
            All_tab(),
            Center(child: Text("Content for Tab 2")),
            Center(child: Text("Content for Tab 3")),
            Center(child: Text("Content for Tab 4")),
          ],
        ),
      ),
    );
  }
}
