import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesScreenController extends GetxController{
  // Text Controllers for input fields
  TextEditingController imojiController = TextEditingController();
  TextEditingController titleController = TextEditingController();


  // Reactive state variables
  var isLoading = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  // Validate and create an account
  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      addCategories();
    }
  }

  // Function to add categories to Firebase
  void addCategories() async {
    try {
      isLoading.value = true;

      final sharedPref = await SharedPreferences.getInstance();
      String? uid =  sharedPref.getString('uid'); 

      // Data to be added
      Map<String, dynamic> categoryData = {
        "title": titleController.text.trim(),
        "imoji": imojiController.text.trim(),
        "task": [],
        'uid': uid
      };

      // Add to 'categories' collection
      await firestore.collection('categories').add(categoryData);

      // Clear text fields after successful submission
      imojiController.clear();
      titleController.clear();

      // Show success message
      Get.snackbar("Success", "Category added successfully",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
        
    } catch (e) {
      // Show error message
      Get.snackbar("Error", "Failed to add category: $e",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  void deleteCategories({required String docId})async{
    try {
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(docId)
          .delete();

      // Show success message
      Get.snackbar("Success", "Category deleted successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);

      
    } catch (e) {
      // Show error message if deletion fails
      Get.snackbar("Error", "Failed to delete category: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

}