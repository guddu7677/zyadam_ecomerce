import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _LoginPageState();
}

class _LoginPageState extends State<login_page> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = FlutterSecureStorage();
  bool _isNotValid = false;
  final String apiUrl = dotenv.env['FLUTTER_API_URL'] ?? '';

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() => _isNotValid = true);
      return;
    }

    final url = Uri.parse("$apiUrl/auth/jwt/create/");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final refreshToken = data["refresh"];

      final refreshUrl = Uri.parse("$apiUrl/auth/jwt/refresh/");
      final refreshResponse = await http.post(
        refreshUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"refresh": refreshToken}),
      );

      if (refreshResponse.statusCode == 200 ||
          refreshResponse.statusCode == 201) {
        final data = jsonDecode(refreshResponse.body);
        final accessToken = data["access"];

        final accesshUrl = Uri.parse("$apiUrl/auth/jwt/verify/");
        final accessResponse = await http.post(
          accesshUrl,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"token": accessToken}),
        );
      }

      print(refreshResponse.body);
      // await storage.write(key: "access_token", value: data["access"]);
      // await storage.write(key: "refresh_token", value: data["refresh"]);
      // Navigator.pushNamed(context, "/Bottombar");
    } else {
      Get.snackbar("Login Failed", "Invalid email or password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text("Welcome Back!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                errorText: _isNotValid ? "Enter a valid email" : null,
                prefixIcon: const Icon(Icons.mail),
                hintText: "Email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                hintText: "Password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loginUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 43),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Log in",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
