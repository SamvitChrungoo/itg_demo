// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/utils/constants.dart';

class YogWidget extends StatelessWidget {
  const YogWidget(this.yog);
  final Yog yog;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Yog',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        kSizedBoxHeight10,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Yoh Number:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(yog.yogDetails!.yogNumber.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Yoh Name:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(yog.yogDetails?.yogName ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Expanded(
              flex: 1,
              child: Text('Special:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(yog.yogDetails?.special ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Expanded(
              flex: 1,
              child: Text('Meaning:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(yog.yogDetails?.meaning ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('End Time:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(
                  '${yog.endTime!.hour} hr ${yog.endTime!.minute} min ${yog.endTime!.second} sec',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
      ],
    );
  }
}
