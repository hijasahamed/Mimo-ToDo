import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class BackAndTitleWidget extends StatelessWidget {
  const BackAndTitleWidget({
    super.key,
    required this.screenSize,
    this.isForgotPassword
  });

  final Size screenSize;
  final bool? isForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: screenSize.width/6,left: screenSize.width/100),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
            Get.back();
            },
          ),
        ),
        MimoTextWidget(
          text: isForgotPassword == true ? 'Forgot Password' : 'Create an Account',
          color: Colors.white,
          size: screenSize.width / 20,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}