import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/view/screens/login_screen/login_screen.dart';
import 'package:mimo_flutter_app/view/screens/register_screen/register_screen.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.screenSize,
    this.registerPage,
    this.forgotPasswordPage
  });

  final Size screenSize;
  final bool? registerPage;
  final bool? forgotPasswordPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height/35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MimoTextWidget(text: (registerPage== true)? 'Already have an account?' : "Don't have an account?", color: Colors.white70, size: screenSize.width/30, weight: FontWeight.w500),
          TextButton(
            onPressed: () {
              (registerPage==true)? Get.offAll(LoginScreen(screenSize: screenSize,)) : (forgotPasswordPage==true)? Get.off(() => RegisterScreen(screenSize: screenSize)) : Get.to(() => RegisterScreen(screenSize: screenSize));
            },
            child: MimoTextWidget(text: (registerPage== true)? 'Log In' :  'Register', color: Colors.white, size: screenSize.width/30, weight: FontWeight.w500,decor: TextDecoration.underline,),
          ),
        ],
      ),
    );
  }
}