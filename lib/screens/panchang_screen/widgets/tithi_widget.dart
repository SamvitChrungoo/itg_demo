// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/utils/constants.dart';

class TithiWidget extends StatelessWidget {
  const TithiWidget(this.tithi);
  final Tithi tithi;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tithi',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        kSizedBoxHeight10,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Tithi Number:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(tithi.details!.tithiNumber.toString(),
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Tithi Name:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(tithi.details?.tithiName ?? '',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
        kSizedBoxHeight6,
        Row(children: [
          const Expanded(
              flex: 1,
              child: Text('Special:',
                  style: TextStyle(color: Colors.black54, fontSize: 14))),
          Expanded(
              flex: 2,
              child: Text(tithi.details?.special ?? '',
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
              child: Text(tithi.details?.summary ?? '',
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
              child: Text(tithi.details?.deity ?? '',
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
                  '${tithi.endTime!.hour} hr ${tithi.endTime!.minute} min ${tithi.endTime!.second} sec',
                  style: const TextStyle(color: Colors.black54, fontSize: 14)))
        ]),
      ],
    );
  }
}
