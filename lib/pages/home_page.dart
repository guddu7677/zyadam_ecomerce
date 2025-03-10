import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/troly.png",
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/login_signup");
              },
              child: Text(
                "HomeHaven",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
          )
        ],
      ),
    );
  }
}
