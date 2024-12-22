import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/controller/splash_screen_controller.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final SplashScreenController splashScreenController = Get.put(SplashScreenController());

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {    
    splashScreenController.checkIfUserLogedin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: widget.screenSize.width / 6,
            child: MimoTextWidget(
                text: 'MIMO',
                color: Colors.white,
                size: widget.screenSize.width / 15,
                weight: FontWeight.bold)),
      )),
    );
  }
}