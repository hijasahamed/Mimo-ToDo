import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:mimo_flutter_app/controller/forgot_password_controller.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class ForgotEmailFieldWidget extends StatelessWidget {
  const ForgotEmailFieldWidget({
    super.key,
    required this.forgotPasswordController,
    required this.screenSize
  });

  final ForgotPasswordController forgotPasswordController;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width/13),
      child: Form(
        key: forgotPasswordController.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: forgotPasswordController.emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 38, 53, 73),
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Email is required.";
                }
                if (!GetUtils.isEmail(value.trim())) {
                  return "Enter a valid email.";
                }
                return null;
              },
            ),
            SizedBox(height: screenSize.height/120,),
            MimoTextWidget(
              text: 'Enter the email address you used to create your account and we will email you a link to reset your password.', 
              color: Colors.grey, 
              size: screenSize.width/35, 
              weight: FontWeight.w400,
              maxline: true,
              alignTextCenter: true,
            )
          ],
        ),
      ),
    );
  }
}