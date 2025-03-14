import 'package:flutter/material.dart';

class security_page extends StatefulWidget {
  const security_page({super.key});

  @override
  State<security_page> createState() => _security_pageState();
}

class _security_pageState extends State<security_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/My_Account");
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
    );
  }
}
