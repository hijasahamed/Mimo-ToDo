import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/create_account_controller.dart';

class CreateTextFormFieldWidget extends StatelessWidget {
  const CreateTextFormFieldWidget({
    super.key,
    required this.screenSize,
    required this.controller
  });

  final Size screenSize;
  final CreateAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/13),
        child: Form(
          key: controller.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                
          TextFormField(
            controller: controller.fullNameController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              filled: true,             
              fillColor: const Color.fromARGB(255, 38, 53, 73),
              hintText: 'Full Name',
              hintStyle: const TextStyle(color: Colors.white70),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide.none,
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Full Name is required.";
              }
              return null;
            },
          ),
          SizedBox(height: screenSize.height/45),
          TextFormField(
            controller: controller.emailController,
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
            controller: controller.passwordController,
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
          SizedBox(height: screenSize.height/45),
          TextFormField(
            controller: controller.confirmPasswordController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 38, 53, 73),
              hintText: 'Confirm Password',
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
                return "Confirm Password is required.";
              }
              if (value.trim() != controller.passwordController.text.trim()) {
                return "Passwords do not match.";
              }
              return null;
            },
          ),
        ],
        ),
      ),
    );
  }
}