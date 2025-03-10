import 'package:flutter/material.dart';

class Login_with_otp extends StatefulWidget {
  const Login_with_otp({super.key});

  @override
  State<Login_with_otp> createState() => _Login_with_otpState();
}

class _Login_with_otpState extends State<Login_with_otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: TextField(
                showCursor: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone number",
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
