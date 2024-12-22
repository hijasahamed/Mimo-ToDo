import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/categories_screen_controller.dart';
import 'package:mimo_flutter_app/view/screens/details_screen/details_screen.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

Widget buildCategoryContainer({required dynamic imoji,required String title,required String task,required Size screenSize,required CategoriesScreenController categoriesScreenController,required String docId}) {
    return InkWell(
      onTap: () => Get.to(() => DetailsScreen(screenSize: screenSize,docId: docId,title: title,)),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 38, 53, 73),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: EdgeInsets.all(screenSize.width/75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(screenSize.width/30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.height/150,),
                  MimoTextWidget(text: imoji, color: Colors.black, size: screenSize.width/29, weight: FontWeight.w500),
                  SizedBox(height: screenSize.height/150,),
                  MimoTextWidget(text: title, color: Colors.white, size: screenSize.width/29, weight: FontWeight.w500),   
                  SizedBox(height: screenSize.height/150,),       
                  MimoTextWidget(text: '$task tasks', color: Colors.white, size: screenSize.width/29, weight: FontWeight.w500),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Get.dialog(                  
                    AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 38, 53, 73),
                      title: const Text("Delete Category",style: TextStyle(color: Colors.white),),
                      content: const Text("Are you sure you want to delete this category?",style: TextStyle(color: Colors.white),),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel",style: TextStyle(color: Colors.white),),
                        ),
                        TextButton(
                          onPressed: () async {
                            categoriesScreenController.deleteCategories(docId: docId);
                            Get.back();                          
                          },
                          child: const Text("Delete",style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(Icons.more_vert,color: Colors.grey,size: screenSize.width/20,),
              ),
            )
          ],
        ),
      ),
    );
  }