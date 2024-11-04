import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,

    this.height,
    this.width,
    this.backGroundcolor = Colors.transparent,

    this.bordersColor = Colors.transparent,
    this.onTap, this.widget,
  });


  final double? height;
  final double? width;
  final Color backGroundcolor;

  final Color bordersColor;
  final void Function()? onTap;

  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: bordersColor),
            borderRadius: BorderRadius.circular(12),
            color: backGroundcolor,
            // color: ColorManger.primaryGreen
          ),
          child: widget),
    );
  }
}
