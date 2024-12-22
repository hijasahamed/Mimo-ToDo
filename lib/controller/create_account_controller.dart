import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/firebase_authentication_controller.dart';
import 'package:mimo_flutter_app/main.dart';
import 'package:mimo_flutter_app/view/screens/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountController extends GetxController {
  // Text Controllers for input fields
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Reactive state variables
  var isLoading = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Firebase instances
  final FirebaseAuthService authService = FirebaseAuthService();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Validate and create an account
  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      createAccount();
    }
  }

  // Account creation logic
  void createAccount() async {
    isLoading.value = true;

    try {
      // Sign up the user with email and password
      User? user = await authService.userSignup(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        // Add user details to Firestore
        await firestore.collection('userData').doc(user.uid).set({
          'name': fullNameController.text.trim(),
          'email': emailController.text.trim(),
          'uid': user.uid,
        });

        // Setting user as logged
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);

        // Show success message
        Get.snackbar(
          margin: const EdgeInsets.all(6),
          "Success",
          "Account created successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate to login or home screen
        Get.to(() => const HomeScreen());
      } else {
        // Show error message if user signup failed
        Get.snackbar(
          margin: const EdgeInsets.all(6),
          "Error",
          "Failed to create an account.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        margin: const EdgeInsets.all(6),
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose controllers when the controller is destroyed
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}