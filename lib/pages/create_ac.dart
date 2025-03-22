import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  final String apiUrl = dotenv.env['FLUTTER_API_URL'] ?? '';

  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  void _toggleLoading(bool value) {
    if (mounted) {
      setState(() => _isLoading = value);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;
    _toggleLoading(true);
    _errorMessage = null;
    FocusScope.of(context).unfocus();

    var regBody = {
      "first_name": firstnameController.text.trim(),
      "last_name": lastnameController.text.trim(),
      "phone": phoneController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };

    try {
      var response = await http.post(
        Uri.parse("$apiUrl/account/user/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );

      var responseData = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        setState(() =>
            _errorMessage = responseData['msg'] ?? "Registration successful.");
        Navigator.pushNamed(context, "/login_page");
      } else {
        setState(() =>
            _errorMessage = responseData['error'] ?? "Registration failed.");
      }
    } on SocketException {
      setState(() => _errorMessage = "No Internet connection.");
    } catch (e) {
      setState(() => _errorMessage = "An error occurred. Please try again.");
    }
    _toggleLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text("Create Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(_errorMessage!,
                      style: const TextStyle(color: Colors.red)),
                ),
              _buildTextField("First Name", Icons.person, firstnameController),
              _buildTextField("Last Name", Icons.person, lastnameController),
              _buildTextField("Phone Number", Icons.phone, phoneController,
                  isPhone: true),
              _buildTextField("Email", Icons.mail, emailController,
                  isEmail: true),
              _buildTextField(
                "Password",
                Icons.lock,
                passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Create Account",
                        style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hint, IconData icon, TextEditingController controller,
      {bool obscureText = false, bool isEmail = false, bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ? _obscurePassword : false,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : (isPhone ? TextInputType.phone : TextInputType.text),
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "$hint is required";
          }
          if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return "Enter a valid email address";
          }
          if (hint == "Password" && value.length < 8) {
            return "Password must be at least 8 characters";
          }
          return null;
        },
      ),
    );
  }
}
