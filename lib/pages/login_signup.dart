import 'package:flutter/material.dart';

class login_signup extends StatefulWidget {
  const login_signup({super.key});

  @override
  State<login_signup> createState() => _login_signupState();
}

class _login_signupState extends State<login_signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/image.png",
          ),
          Center(
            child: Text(
              "Tap a button",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              "Get your groceries delivered or ready for pickup-and ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              "spend time on what matters ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/Bottombar");
                },
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                      child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/login_page");
                },
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
