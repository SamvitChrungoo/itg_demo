import 'package:flutter/material.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/screens/panchang_screen/widgets/karan_widget.dart';
import 'package:itg_demo/screens/panchang_screen/widgets/nakshatra_widget.dart';
import 'package:itg_demo/screens/panchang_screen/widgets/sun_timings.dart';
import 'package:itg_demo/screens/panchang_screen/widgets/tithi_widget.dart';
import 'package:itg_demo/screens/panchang_screen/widgets/yog_widget.dart';
import 'package:itg_demo/utils/constants.dart';

class PanchangDetailWidget extends StatelessWidget {
  const PanchangDetailWidget({Key? key, required this.panchangDetails})
      : super(key: key);
  final PanchangResponse panchangDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SunTimings('Sunrise', panchangDetails.sunrise!),
              SunTimings('Sunset', panchangDetails.sunset!),
              SunTimings('Moonrise', panchangDetails.moonrise!),
              SunTimings('Moonset', panchangDetails.moonset!),
            ],
          ),
          kSizedBoxHeight20,
          TithiWidget(panchangDetails.tithi!),
          kSizedBoxHeight20,
          NakshatraWidget(panchangDetails.nakshatra!),
          kSizedBoxHeight20,
          YogWidget(panchangDetails.yog!),
          kSizedBoxHeight20,
          KaranWidget(panchangDetails.karan!),
          kSizedBoxHeight20,
        ],
      ),
    );
  }
}
