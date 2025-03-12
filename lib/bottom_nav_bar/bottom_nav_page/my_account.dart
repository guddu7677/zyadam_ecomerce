import 'package:flutter/material.dart';

class My_Account extends StatefulWidget {
  const My_Account({super.key});

  @override
  State<My_Account> createState() => _My_AccountState();
}

class _My_AccountState extends State<My_Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Darker background to highlight the white shadow
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                  ),
                  title: Text(
                    "Claire Cooper",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "claire.cooper@mail.com",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "General",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.receipt),
                  title: Text(
                    "Transaction",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.favorite_outline),
                  title: Text(
                    "Wishlist",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.bookmark_add_outlined),
                  title: Text(
                    "Saved Address",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.payment_outlined),
                  title: Text(
                    "Payment Methods",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(
                    "Notification",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.lock_clock_outlined),
                  title: Text(
                    "Security",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.5), // White shadow with opacity
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // How much blur the shadow has
                      spreadRadius: 2, // How much the shadow spreads
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    "Log out",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
