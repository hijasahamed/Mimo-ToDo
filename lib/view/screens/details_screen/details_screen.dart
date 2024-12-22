import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/details_screen_controller.dart';
import 'package:mimo_flutter_app/view/widgets/details_screen_widget/details_screen_body.dart';
import 'package:mimo_flutter_app/view/widgets/details_screen_widget/details_screen_floating_button.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.screenSize,required this.docId,required this.title});
  final Size screenSize;
  final String title;
  final String docId;
  @override
  Widget build(BuildContext context) {
    DetailsScreenController detailsScreenController = Get.put(DetailsScreenController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 36, 47),
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: MimoTextWidget(text: title,  color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: DetailsScreenBody(docId: docId, screenSize: screenSize),
      floatingActionButton: DetailsScreenFloatingButton(detailsScreenController: detailsScreenController, screenSize: screenSize, docId: docId)
    );
  }
}