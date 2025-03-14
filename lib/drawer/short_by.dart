import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String category;

  Product({required this.name, required this.price, required this.category});
}

List<Product> allProducts = [
  Product(name: "T-shirt", price: 29.99, category: "Clothing"),
  Product(name: "Laptop", price: 999.99, category: "Electronics"),
  Product(name: "Shoes", price: 49.99, category: "Footwear"),
  Product(name: "Washing Machine", price: 499.99, category: "Home Appliances"),
  Product(name: "Headphones", price: 89.99, category: "Electronics"),
];

class short_by extends StatefulWidget {
  const short_by({super.key});

  @override
  State<short_by> createState() => _short_byState();
}

class _short_byState extends State<short_by> {
  List<Product> displayedProducts = List.from(allProducts);
  String selectedCategory = 'All';
  String selectedSort = 'Price: Low to High';

  // Sort by price
  void _sortProducts(String sortOption) {
    setState(() {
      if (sortOption == 'Price: Low to High') {
        displayedProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (sortOption == 'Price: High to Low') {
        displayedProducts.sort((a, b) => b.price.compareTo(a.price));
      } else if (sortOption == 'Name: A to Z') {
        displayedProducts.sort((a, b) => a.name.compareTo(b.name));
      } else if (sortOption == 'Name: Z to A') {
        displayedProducts.sort((a, b) => b.name.compareTo(a.name));
      }
    });
  }

  // Filter by category
  void _filterProducts(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'All') {
        displayedProducts = List.from(allProducts);
      } else {
        displayedProducts = allProducts
            .where((product) => product.category == category)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce App"),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSortMenu(),
          Expanded(
            child: ListView.builder(
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) {
                final product = displayedProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text("\$${product.price}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build Sort Menu (Price or Name)
  Widget _buildSortMenu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: selectedSort,
        onChanged: (value) {
          setState(() {
            selectedSort = value!;
            _sortProducts(value);
          });
        },
        items: [
          DropdownMenuItem(
              value: 'Price: Low to High', child: Text('Price: Low to High')),
          DropdownMenuItem(
              value: 'Price: High to Low', child: Text('Price: High to Low')),
          DropdownMenuItem(value: 'Name: A to Z', child: Text('Name: A to Z')),
          DropdownMenuItem(value: 'Name: Z to A', child: Text('Name: Z to A')),
        ],
      ),
    );
  }

  // Filter Dialog
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Filter by Category"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("All"),
                onTap: () {
                  _filterProducts('All');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Clothing"),
                onTap: () {
                  _filterProducts('Clothing');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Electronics"),
                onTap: () {
                  _filterProducts('Electronics');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Footwear"),
                onTap: () {
                  _filterProducts('Footwear');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Home Appliances"),
                onTap: () {
                  _filterProducts('Home Appliances');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
