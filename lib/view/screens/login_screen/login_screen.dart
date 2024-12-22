import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/login_account_controller.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/continue_button_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/forgot_password_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/logo_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/register_button_widget.dart';
import 'package:mimo_flutter_app/view/widgets/login_screen_widget/textforms_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final LoginAccountController loginAccountController = Get.put(LoginAccountController());
    return Scaffold(
        
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width/14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  // Logo
                  LogoWidget(screenSize: screenSize),
                  // Email field && Password field
                  TextFormsWidgets(screenSize: screenSize,loginAccountController: loginAccountController,),
                  // Forgot Password
                  ForgotPasswordWidget(screenSize: screenSize),
                  // Continue button
                  ContinueButtonWidget(screenSize: screenSize,controller: loginAccountController,),
                  // Register link
                  RegisterButtonWidget(screenSize: screenSize),
                ],
            ),
          ),
        )
      ),
    );
  }
}