// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/model/astrologer_response.dart';
import 'package:itg_demo/screens/talk_to_astrologer_screen/widgets/talk_on_call_widget.dart';
import 'package:itg_demo/utils/constants.dart';
import 'package:itg_demo/utils/helpers.dart';

class AstrolgerCard extends StatelessWidget {
  const AstrolgerCard(this.astrologer);
  final AstrologerResponse astrologer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 80,
              width: 80,
              child: isImageValid(astrologer)
                  ? Image.network(astrologer.images!.large!.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset(kPlaceHolderImage))
                  : Image.asset(kPlaceHolderImage)),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getName(astrologer),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                kSizedBoxHeight4,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.settings_applications,
                        size: 14, color: kSelectedColor),
                    kSizedBoxWidth4,
                    Expanded(
                      child: Text(getSkills(astrologer),
                          style: const TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
                kSizedBoxHeight4,
                Row(
                  children: [
                    const Icon(Icons.language, size: 14, color: kSelectedColor),
                    kSizedBoxWidth4,
                    Text(getLanguage(astrologer),
                        style: const TextStyle(fontSize: 13)),
                  ],
                ),
                kSizedBoxHeight4,
                Row(
                  children: [
                    const Icon(Icons.article_outlined,
                        size: 14, color: kSelectedColor),
                    kSizedBoxWidth4,
                    Text(
                        '\u{20B9}${astrologer.additionalPerMinuteCharges?.toInt().toString() ?? ''}/ Min',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                kSizedBoxHeight10,
                TalkOnCallWidget(),
                kSizedBoxHeight20,
              ],
            ),
          )),
          Text('${astrologer.experience?.toInt().toString()} Years'),
        ],
      ),
    );
  }
}
