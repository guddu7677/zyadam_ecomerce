import 'package:flutter/material.dart';

class All_tab extends StatefulWidget {
  const All_tab({super.key});

  @override
  State<All_tab> createState() => _All_tabState();
}

class _All_tabState extends State<All_tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Two items per row
                crossAxisSpacing: 8.0, // Horizontal space between items
                mainAxisSpacing: 8.0, // Vertical space between items
              ),
              itemCount: 8, // Total number of items in the grid
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
