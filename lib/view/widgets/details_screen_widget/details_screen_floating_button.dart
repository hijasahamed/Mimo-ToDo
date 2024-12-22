import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/details_screen_controller.dart';
import 'package:mimo_flutter_app/view/widgets/details_screen_widget/select_date.dart';

class DetailsScreenFloatingButton extends StatelessWidget {
  const DetailsScreenFloatingButton({
    super.key,
    required this.detailsScreenController,
    required this.screenSize,
    required this.docId,
  });

  final DetailsScreenController detailsScreenController;
  final Size screenSize;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.white,
      onPressed: () {
        Get.dialog(
          AlertDialog(
            backgroundColor: const Color.fromARGB(255, 28, 36, 47),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: detailsScreenController.taskController,
                  decoration: InputDecoration(
                    hintText: 'Type your task...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.width / 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenSize.width / 20,
                  ),
                ),
                TextField(
                  controller: detailsScreenController.dateController,
                  onTap: ()async {
                    await selectDate(context, detailsScreenController.dateController);
                  },
                  decoration: InputDecoration(
                    hintText: 'Add Date',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.width / 30,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenSize.width / 20,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  detailsScreenController.taskController.clear();
                  Get.back();
                },
                child: const Text("Back",style: TextStyle(color: Colors.white),),
              ),
              TextButton(
                onPressed: () async {
                  final taskName = detailsScreenController.taskController.text.trim();
                  detailsScreenController.taskController.clear();
                  if (taskName.isNotEmpty) {
                    detailsScreenController.addTaskToCategory(docId, taskName);
                    Get.back();
                  } else {
                    Get.snackbar("Error", "Task name cannot be empty",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  }
                },
                child: const Text("Add",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        );
      },
      child: Center(
        child: Icon(Icons.add,size: screenSize.width/13,color: Colors.blue,),
      ),
    );
  }
}