import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/forgot_password_controller.dart';
import 'package:mimo_flutter_app/view/widgets/forgot_password_screen_widget/forgot_email_texfield_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/continue_button_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/register_button_widget.dart';
import 'package:mimo_flutter_app/view/widgets/register_screen_widget/back_and_title_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      body: SingleChildScrollView(
       child: Column(
        children: [
          SizedBox(height: screenSize.height/5,),
          // back button & Heading
          BackAndTitleWidget(screenSize: screenSize,isForgotPassword: true,),
          SizedBox(height: screenSize.height/45),
          ForgotEmailFieldWidget(forgotPasswordController: forgotPasswordController,screenSize: screenSize,),
          Padding(
            padding: EdgeInsets.only(left: screenSize.width/13,right: screenSize.width/13),
            child: ContinueButtonWidget(screenSize: screenSize,controller: forgotPasswordController,),
          ),
          RegisterButtonWidget(screenSize: screenSize,forgotPasswordPage: true,),
        ],
       ),
      ),
    );
  }
}