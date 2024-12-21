import 'package:flutter/material.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: screenSize.width/6,
            child: MimoTextWidget(
                text: 'MIMO',
                color: Colors.white,
                size: screenSize.width / 15,
                weight: FontWeight.bold)),
      )),
    );
  }
}
