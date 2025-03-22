import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  int currentIndex = 0; // Track the current page index

  // Update the current index when the page changes
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/My_Cart");
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "ADD to Cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/Order_Summary");
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Add to Cart"),
      ),
      body: ListView(
        children: [
          // PageView for images
          Container(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged:
                  onPageChanged, // Update currentIndex on page change
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      "assets/images/ff.png",
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (dotIndex) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: dotIndex == currentIndex
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          ),

          // Product Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Fresh Watermelon",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // Rating and Favorite Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Rating",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text("4.8"),
                    Text(
                      "(176)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(Icons.favorite_border_outlined),
              ],
            ),
          ),

          // Price Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "\$15.99",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "\$25.99",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),

          // Description Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Description",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            width: double.infinity,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Our potatoes are perfect for home cooking, restaurants, and meal prepping. Whether you're making a simple side dish or preparing a hearty main course, these potatoes will bring out the best flavors in your recipes. Available in convenient 5lb bags.",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ),
          ),

          // Related Products Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Related Products",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),

          // GridView for Related Products
          Container(
            height: 250, // Set a fixed height for the grid
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 8.0, // Horizontal space between items
                mainAxisSpacing: 8.0, // Vertical space between items
              ),
              itemCount: 6, // Assuming 6 related products
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
