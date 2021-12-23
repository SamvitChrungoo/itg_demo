// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/utils/constants.dart';

class KaranWidget extends StatelessWidget {
  const KaranWidget(this.karan);
  final Karan karan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Karan',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        kSizedBoxHeight10,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Karan Number:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(karan.karanDetails!.karanNumber.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Karan Name:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(karan.karanDetails?.karanName ?? '',
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
              child: Text(karan.karanDetails?.special ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Deity:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(karan.karanDetails?.deity ?? '',
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
                  '${karan.endTime!.hour} hr ${karan.endTime!.minute} min ${karan.endTime!.second} sec',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
      ],
    );
  }
}
