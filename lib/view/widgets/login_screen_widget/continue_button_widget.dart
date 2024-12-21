import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({
    super.key,
    required this.screenSize,
    this.isRegisterScreen,
    required this.controller
  });

  final Size screenSize;
  final bool? isRegisterScreen;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
      onTap: controller.isLoading.value
        ? null
        : () {
         controller.validateAndSubmit();
      },
      child: Ink(
        width: double.infinity,
        height: screenSize.height/17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: const Color.fromARGB(255, 43, 109, 164)
        ),
        child: controller.isLoading.value
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
      ),
    );
    },);
  }
}