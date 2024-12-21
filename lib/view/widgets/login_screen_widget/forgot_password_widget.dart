import 'package:flutter/material.dart';
import 'package:mimo_flutter_app/view/widgets/mimo_text_widget/mimo_text_widget.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenSize.width/60,bottom: screenSize.width/12),
      child: InkWell(
        onTap: () {
          
        },
        child: MimoTextWidget(text: 'Forgot Password?', color: Colors.white70, size: screenSize.width/30, weight: FontWeight.w500)
      ),
    );
  }
}