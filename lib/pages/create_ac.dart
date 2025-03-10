import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class create_account extends StatefulWidget {
  const create_account({super.key});

  @override
  State<create_account> createState() => _create_accountState();
}

class _create_accountState extends State<create_account> {
  TextEditingController firsnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isNotvalide = false;

  void registerUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        firsnameController.text.isNotEmpty &&
        lastnameController.text.isNotEmpty) {
      var regBody = {
        "fiestname": firsnameController.text,
        "lastname": lastnameController.text,
        "phone": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };
      var response = await http.post(
        Uri.parse("uri"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(regBody),
      );
      print(response);
    } else {
      setState(() {
        _isNotvalide = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Fill in your details below to get started on a ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "seamless shopping experience. ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("OR",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 43,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Continue With Google",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "Already have an account?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                      errorText: _isNotvalide ? "Enter firs name" : null,
                      prefixIcon: Icon(Icons.person),
                      hintText: "First name",
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
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                      errorText: _isNotvalide ? "Enter last name" : null,
                      prefixIcon: Icon(Icons.person),
                      hintText: "Last name",
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
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  showCursor: true,
                  decoration: InputDecoration(
                      errorText: _isNotvalide ? "Enter phone number" : null,
                      prefixIcon: Icon(Icons.phone_android),
                      hintText: "Enter phone",
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
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: emailController,
                  showCursor: true,
                  decoration: InputDecoration(
                      errorText: _isNotvalide ? "Enter Proper Info" : null,
                      prefixIcon: Icon(Icons.mail),
                      hintText: "Email",
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
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  showCursor: true,
                  decoration: InputDecoration(
                      errorText: _isNotvalide ? "Enter Proper Info" : null,
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
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
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: passwordController,
                  showCursor: false,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Confirm Password",
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
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Text("By clicking Create Account, you acknowledge you"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Text("have read and agreed to our Terms"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  registerUser();
                },
                child: Container(
                  height: 43,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    "Create account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
