import 'package:flutter/material.dart';

class notiffiation_page extends StatefulWidget {
  const notiffiation_page({super.key});

  @override
  State<notiffiation_page> createState() => _notiffiation_pageState();
}

class _notiffiation_pageState extends State<notiffiation_page> {
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
