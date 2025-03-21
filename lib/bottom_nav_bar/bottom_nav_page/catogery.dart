import 'package:flutter/material.dart';
import 'package:zyadam_ecomere/drawer/short_by.dart';
import 'package:zyadam_ecomere/tabBar/all_tab.dart';

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
        drawer: Drawer(
          backgroundColor: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 60,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          )),
                          builder: ((context) {
                            return short_by();
                          }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.unfold_more),
                        Text(
                          "Short by",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 60,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_list),
                      Text(
                        "Filtter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
