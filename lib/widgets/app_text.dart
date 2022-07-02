import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppText(
      {Key? key,
      required this.text,
      this.color = Colors.black54,
      this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: size,
        ));
  }
}
