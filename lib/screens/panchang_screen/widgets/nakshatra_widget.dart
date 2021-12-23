// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/utils/constants.dart';

class NakshatraWidget extends StatelessWidget {
  const NakshatraWidget(this.nakshatra);
  final Nakshatra nakshatra;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nakshatra',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        kSizedBoxHeight10,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Nak.Number:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(nakshatra.nakshatraDetails!.nakNumber.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Nak. Name:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(nakshatra.nakshatraDetails?.nakName ?? '',
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
              child: Text(nakshatra.nakshatraDetails?.special ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Expanded(
              flex: 1,
              child: Text('Summary:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(nakshatra.nakshatraDetails?.summary ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Ruler:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(nakshatra.nakshatraDetails?.ruler ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Deity:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(nakshatra.nakshatraDetails?.deity ?? '',
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
                  '${nakshatra.endTime!.hour} hr ${nakshatra.endTime!.minute} min ${nakshatra.endTime!.second} sec',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
      ],
    );
  }
}
