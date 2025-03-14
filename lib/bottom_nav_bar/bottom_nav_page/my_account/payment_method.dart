import 'package:flutter/material.dart';

class Payment_methods extends StatefulWidget {
  const Payment_methods({super.key});

  @override
  State<Payment_methods> createState() => _Payment_methodsState();
}

class _Payment_methodsState extends State<Payment_methods> {
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
