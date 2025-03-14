import 'package:flutter/material.dart';

class save_address extends StatefulWidget {
  const save_address({super.key});

  @override
  State<save_address> createState() => _save_addressState();
}

class _save_addressState extends State<save_address> {
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
