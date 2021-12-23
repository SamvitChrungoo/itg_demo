// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/widgets.dart';
import 'package:itg_demo/utils/constants.dart';
import 'package:itg_demo/widgets/common_icon.dart';

class CommonAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonIcon(asset: kHamburgerIcon, height: 20),
          CommonIcon(asset: kLogo, height: 60),
          CommonIcon(asset: kProfileIcon, height: 25),
        ],
      ),
    );
  }
}
