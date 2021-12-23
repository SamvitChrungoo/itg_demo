// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/utils/constants.dart';

class TalkOnCallWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 35,
      margin: const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: const [
          Icon(Icons.call_rounded, color: Colors.white),
          SizedBox(width: 10),
          Text('Talk on Call',
              style: TextStyle(color: Colors.white, fontSize: 13))
        ],
      ),
      decoration: BoxDecoration(
          color: kSelectedColor, borderRadius: BorderRadius.circular(4)),
    );
  }
}
