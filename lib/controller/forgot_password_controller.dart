import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  // Text Controllers for input fields
  final emailController = TextEditingController();

  // Reactive state variables
  var isLoading = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Validate and create an account
  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      
    }
  }

  // Change password logic
  void changePassword()async{
    isLoading.value = true; 

    
  }

}