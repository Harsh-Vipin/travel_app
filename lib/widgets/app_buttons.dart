import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  AppButtons(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      this.icon,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor, width: 1.0),
          color: backgroundColor),
      child: text != null
          ? Center(child: AppText(text: text!,color: color,size: 16,))
          : Center(
            child: Icon(
                icon,
                color: color,
              ),
          ),
    );
  }
}
