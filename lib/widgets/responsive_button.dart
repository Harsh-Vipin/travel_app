import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/misc/colors.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.isResponsive = false, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("img/button-one.png")],
      ),
    );
  }
}
