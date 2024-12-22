import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/firebase_authentication_controller.dart';
import 'package:mimo_flutter_app/controller/firebase_controller.dart';
import 'package:mimo_flutter_app/main.dart';
import 'package:mimo_flutter_app/view/screens/categories_screen/categories_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAccountController extends GetxController {
  // Text Controllers for input fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive state variables
  var isLoading = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Firebase instances
  final FirebaseAuthService authService = FirebaseAuthService();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseController firebaseController = Get.put(FirebaseController());

  // Validate and create an account
  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      loginAccount();
    }
  }

  // Login account logic
  void loginAccount() async {
    isLoading.value = true;

    try {
      final user = await authService.userLogin(
        emailController.text.trim().toLowerCase(),
        passwordController.text,
      );

      if (user != null) {
        
        // Setting user as logged
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setBool(logedInKey, true);
        dynamic userData = await firebaseController.checkIfUserAvailable(emailController.text.trim().toLowerCase());
        await sharedPref.setString('uid', userData.uid);
        await sharedPref.setString('email', userData.email);
        await sharedPref.setString('name', userData.name);

        // Login successful
        Get.snackbar(
          "Login Successful",
          "Welcome back, ${user.email}",
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(6),
          colorText: Colors.white,
        );

        // Navigate to home screen
        Get.to(() => CategoriesScreen(screenSize: MediaQuery.of(Get.context!).size,));
      } else {
        // Login failed
        Get.snackbar("Login Failed", "No account found with this email. Please create an account.", colorText: Colors.white);
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            "Account not found",
            "No account found with this email. Please create an account.",
            colorText: Colors.white,
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            "Login Failed",
            "Incorrect password. Please try again.",
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error",
            "An error occurred: ${e.message}",
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "An unexpected error occurred. Please try again.",
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  
  @override
  void onClose() {
    // Dispose controllers when the controller is destroyed
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  
}