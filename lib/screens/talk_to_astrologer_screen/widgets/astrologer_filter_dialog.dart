// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:itg_demo/provider/bloc/itg_bloc.dart';
import 'package:itg_demo/provider/events/itg_events.dart';
import 'package:itg_demo/screens/talk_to_astrologer_screen/widgets/custom_filter_chips.dart';
import 'package:itg_demo/utils/constants.dart';

class AstrologerFilterDialog extends StatefulWidget {
  final ITGBolc bloc;
  AstrologerFilterDialog({required this.bloc});

  @override
  _AstrologerFilterDialogState createState() => _AstrologerFilterDialogState();
}

class _AstrologerFilterDialogState extends State<AstrologerFilterDialog> {
  var _selectedLanguages = <String>[];
  var _selectedSkills = <String>[];

  @override
  void initState() {
    _selectedLanguages = widget.bloc.filteredLanguages;
    _selectedSkills = widget.bloc.filteredSkills;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedBoxHeight10,
                kSizedBoxHeight6,
                const Text('Filter By',
                    style: TextStyle(fontSize: 16, color: kSelectedColor)),
                kSizedBoxHeight6,
                Container(height: 0.5, color: Colors.grey),
                kSizedBoxHeight10,
                const Text('Languages',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10.0,
                  children: astrologerLanguages
                      .map(
                        (e) => CustomFilterChip(
                            name: e,
                            bloc: widget.bloc,
                            onChipTapped: (isSelected) => isSelected
                                ? _selectedLanguages.add(e)
                                : _selectedLanguages.remove(e)),
                      )
                      .toList(),
                ),
                kSizedBoxHeight20,
                const Text('Skills',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 10.0,
                  children: astrologerSkills
                      .map(
                        (e) => CustomFilterChip(
                            name: e,
                            bloc: widget.bloc,
                            onChipTapped: (isSelected) => isSelected
                                ? _selectedSkills.add(e)
                                : _selectedSkills.remove(e)),
                      )
                      .toList(),
                ),
                kSizedBoxHeight40,
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    widget.bloc.add(FilterAstrologersEvent(
                        languages: _selectedLanguages,
                        skills: _selectedSkills));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40,
                    child: const Center(
                      child: Text('Apply',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    decoration: const BoxDecoration(
                        color: kSelectedColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                  ),
                ),
                kSizedBoxHeight40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
