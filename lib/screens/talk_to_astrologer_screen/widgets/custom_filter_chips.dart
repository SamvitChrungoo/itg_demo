import 'package:flutter/material.dart';
import 'package:itg_demo/provider/bloc/itg_bloc.dart';
import 'package:itg_demo/utils/constants.dart';

class CustomFilterChip extends StatefulWidget {
  const CustomFilterChip(
      {Key? key,
      required this.name,
      required this.onChipTapped,
      required this.bloc})
      : super(key: key);
  final String name;
  final ITGBolc bloc;
  final Function(bool) onChipTapped;

  @override
  _CustomFilterChipState createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  bool _isSelected = false;

  @override
  void initState() {
    final allFilters =
        widget.bloc.filteredLanguages + widget.bloc.filteredSkills;
    _isSelected = allFilters.contains(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.name),
      elevation: 1,
      labelStyle: TextStyle(
          color: !_isSelected ? Colors.black : Colors.white, fontSize: 13),
      pressElevation: 1,
      selected: _isSelected,
      backgroundColor: kSelectedColor.withOpacity(0.2),
      onSelected: (val) {
        setState(() {
          _isSelected = !_isSelected;
          widget.onChipTapped(_isSelected);
        });
      },
      checkmarkColor: Colors.white,
      selectedColor: kSelectedColor,
    );
  }
}
