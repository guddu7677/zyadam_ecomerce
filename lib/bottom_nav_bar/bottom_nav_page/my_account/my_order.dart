import 'package:flutter/material.dart';

class My_order extends StatefulWidget {
  const My_order({super.key});

  @override
  State<My_order> createState() => _My_orderState();
}

class _My_orderState extends State<My_order> {
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
          ),
        ),
        title: Text(
          "My Order",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.gif_box))],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
