import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/view/screens/login_screen/login_screen.dart';

class ForgotPasswordController extends GetxController {
  // Text Controllers for input fields
  final emailController = TextEditingController();

  // Reactive state variables
  var isLoading = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Validate and send the reset password email
  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      changePassword();
    }
  }

  // Change password logic
  void changePassword() async {
    isLoading.value = true;

    final email = emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
        (value) {
          Get.snackbar(
            'Password Reset',
            'Password reset email sent successfully.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
      ).then(
        (value) => Get.offAll(() => LoginScreen(screenSize: MediaQuery.of(Get.context!).size)),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors gracefully
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for this email.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = 'Something went wrong. Please try again.';
      }

      Get.snackbar(
        'Error',
        errorMessage,
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
    emailController.dispose();
    super.onClose();
  }
}