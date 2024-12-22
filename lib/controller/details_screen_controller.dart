import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreenController extends GetxController{

  final taskController = TextEditingController();

  Future<void> addTaskToCategory(String docId, String taskName) async {
    try {
      // Get current date and time
      final dateTime = DateTime.now();
      final formattedDateTime =
          "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";

      // Task data to be added
      final taskData = {
        "name": taskName,
        "time": formattedDateTime,
      };

      // Update the Firestore document
      final docRef = FirebaseFirestore.instance.collection('categories').doc(docId);
      await docRef.update({
        "task": FieldValue.arrayUnion([taskData]),
      });

      Get.snackbar("Success", "Task added successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);  
    } catch (e) {
      Get.snackbar("Error", "Failed to add task: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

}