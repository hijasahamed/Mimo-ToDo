import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/categories_screen_controller.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

Widget buildAddCategoryContainer({required BuildContext context,required CategoriesScreenController categoriesScreenController,required Size screenSize}) {
    return GestureDetector(
      onTap: () {        
        showDialog(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.transparent,              
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height/7,),                    
                    Dialog( 
                      backgroundColor: Colors.transparent,
                      child: Container(                    
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 38, 53, 73),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: categoriesScreenController.formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () => Get.back(),
                                    child: CircleAvatar(
                                      radius: screenSize.width/27,
                                      backgroundColor: Colors.white,
                                      child: const Icon(Icons.close,color: Colors.blueGrey,),
                                    ),
                                  ),
                                ),
                                // Text Field for Emoji
                                TextFormField(
                                  controller: categoriesScreenController.imojiController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Add Emoji',
                                    hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Please enter an emoji';
                                    }
                                    return null;
                                  },
                                ),
                                // Text Field for Title
                                TextFormField(
                                  controller: categoriesScreenController.titleController,
                                  textCapitalization: TextCapitalization.words,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Add Title',
                                    hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: screenSize.width / 20),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Please enter a title';
                                    }
                                    return null;
                                  },
                                ),
                                // Text Field for Task
                                Padding(
                                  padding: EdgeInsets.only(left: screenSize.width/30),
                                  child: MimoTextWidget(text: '0 task', color: Colors.grey, size: screenSize.width / 20, weight: FontWeight.w400),
                                ),
                                SizedBox(height: screenSize.height/20,),
                                Obx(() {
                                return TextButton(
                                onPressed: categoriesScreenController.isLoading.value
                                  ? null
                                  : () {
                                    Get.back();
                                  categoriesScreenController.validateAndSubmit();
                                },
                                child: categoriesScreenController.isLoading.value
                                ? Center(
                                  child: SizedBox(
                                    height: screenSize.width / 20,
                                    width: screenSize.width / 20, 
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                                : Center(
                                  child: MimoTextWidget(
                                      text: 'CONTINUE',
                                      color: Colors.white,
                                      size: screenSize.width / 31,
                                      weight: FontWeight.w500,
                                    ),
                                ),
                              );
                              },)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 38, 53, 73),
          borderRadius: BorderRadius.circular(3),
        ),
        child: const Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(Icons.add, color: Colors.blue, size: 30)
          ),
        ),
      ),
    );
  }