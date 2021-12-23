// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:itg_demo/utils/constants.dart';

class CommonIcon extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CommonIcon({
    required this.asset,
    this.onTap,
    this.height = 20,
    this.isSelected = true,
  });

  final Function? onTap;
  final String asset;
  final bool isSelected;
  final double height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Image.asset(
        asset,
        height: height,
        color: asset == kLogo
            ? null
            : isSelected
                ? kSelectedColor
                : kUnselectedColor,
      ),
    );
  }
}
