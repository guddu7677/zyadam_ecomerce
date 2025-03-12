import 'package:flutter/material.dart';

class short_by extends StatefulWidget {
  const short_by({super.key});

  @override
  State<short_by> createState() => _short_byState();
}

class _short_byState extends State<short_by> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("short by"),
        actions: [TextButton(onPressed: () {}, child: Text("Clear"))],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
