import 'package:flutter/material.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height/15,bottom: screenSize.height/25),
      child: Align(
        alignment: Alignment.center,
        child: MimoTextWidget(
          text: 'mimo', color: Colors.white, size: screenSize.width/8, weight: FontWeight.bold
        )
      ),
    );
  }
}