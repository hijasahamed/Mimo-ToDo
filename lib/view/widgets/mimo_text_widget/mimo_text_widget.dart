import 'package:flutter/material.dart';

class MimoTextWidget extends StatelessWidget {
  const MimoTextWidget(
      {super.key,
      required this.text,
      required this.color,
      this.maxline,
      required this.size,
      this.decor,
      this.alignTextCenter,
      required this.weight});
  final String text;
  final Color color;
  final double size;
  final bool? maxline;
  final FontWeight weight;
  final bool? alignTextCenter;
  final TextDecoration? decor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        color: color,
        fontSize: size,
        decoration: decor,
        decorationColor: Colors.white,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: (maxline==true)? 10 :1,
      textAlign: (alignTextCenter==true)?TextAlign.center:TextAlign.left,
    );
  }
}