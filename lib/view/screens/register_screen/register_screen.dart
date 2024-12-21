import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/create_account_controller.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/continue_button_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/register_button_widget.dart';
import 'package:mimo_flutter_app/view/widgets/register_screen_widget/back_and_title_widget.dart';
import 'package:mimo_flutter_app/view/widgets/register_screen_widget/create_textform_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final CreateAccountController controller = Get.put(CreateAccountController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 36, 47),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height/7,),
              // back button & Heading
              BackAndTitleWidget(screenSize: screenSize),
              // Create account textformfields
              CreateTextFormFieldWidget(screenSize: screenSize,controller: controller,),
              // Continue button
              Padding(
                padding: EdgeInsets.only(left: screenSize.width/13,right: screenSize.width/13),
                child: ContinueButtonWidget(screenSize: screenSize,controller: controller,),
              ),
              // Log In button
              RegisterButtonWidget(screenSize: screenSize,registerPage: true,)
            ],
          ),
        )
      ),
    );
  }
}