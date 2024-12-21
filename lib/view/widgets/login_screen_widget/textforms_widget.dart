import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:mimo_flutter_app/controller/login_account_controller.dart';

class TextFormsWidgets extends StatelessWidget {
  const TextFormsWidgets({
    super.key,
    required this.screenSize,
    required this.loginAccountController
  });
  final Size screenSize;
  final LoginAccountController loginAccountController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginAccountController.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: loginAccountController.emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 38, 53, 73),
              hintText: 'Email',
              hintStyle: const TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Email is required.";
              }
              if (!GetUtils.isEmail(value.trim())) {
                return "Enter a valid email.";
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height/45),
          TextFormField(
            controller: loginAccountController.passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 38, 53, 73),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Password is required.";
              }
              if (value.trim().length < 6) {
                return "Password must be at least 6 characters.";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}