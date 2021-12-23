import 'package:flutter/material.dart';
import 'package:itg_demo/utils/constants.dart';

class SunTimings extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SunTimings(this.title, this.time);

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.wb_sunny_outlined, color: Colors.blueGrey, size: 20),
        kSizedBoxWidth4,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 10.5)),
            Text(time,
                style: const TextStyle(color: Colors.black54, fontSize: 11.5))
          ],
        ),
        kSizedBoxWidth10,
        kSizedBoxWidth4
      ],
    );
  }
}
