import 'package:flutter/material.dart';

class transaction_page extends StatefulWidget {
  const transaction_page({super.key});

  @override
  State<transaction_page> createState() => _transaction_pageState();
}

class _transaction_pageState extends State<transaction_page> {
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
