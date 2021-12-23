// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:itg_demo/model/location_response.dart';
import 'package:itg_demo/provider/bloc/itg_bloc.dart';
import 'package:itg_demo/provider/events/itg_events.dart';
import 'package:itg_demo/provider/states/itg_states.dart';
import 'package:itg_demo/screens/panchang_screen/widgets/panchang_detail_widget.dart';
import 'package:itg_demo/utils/constants.dart';

class PanchangScreen extends StatefulWidget {
  const PanchangScreen({required this.bloc, Key? key}) : super(key: key);
  final ITGBolc bloc;

  @override
  _PanchangScreenState createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen>
    with AutomaticKeepAliveClientMixin {
  DateTime _selectedDate = DateTime.now();
  LocationResponse? _selectedLocation;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.arrow_back_ios, size: 18),
                  Text('Daily Panchang',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              kSizedBoxHeight10,
              const Text(kPanchangDescription, style: TextStyle(fontSize: 12)),
              kSizedBoxHeight10,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: kSelectedColor.withOpacity(0.2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            flex: 1, child: Center(child: Text('Date:'))),
                        Expanded(
                          flex: 3,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () async {
                              final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050));
                              setState(() {
                                _selectedDate = date!;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              height: 40,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateFormat('d MMMM, yyyy')
                                      .format(_selectedDate)),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    kSizedBoxHeight20,
                    Row(
                      children: [
                        const Expanded(
                            flex: 1, child: Center(child: Text('Location:'))),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 40,
                            color: Colors.white,
                            child: TypeAheadField(
                              suggestionsBoxDecoration:
                                  const SuggestionsBoxDecoration(
                                      elevation: 0.0),
                              hideOnEmpty: true,
                              hideOnLoading: true,
                              textFieldConfiguration: TextFieldConfiguration(
                                  controller: _textEditingController,
                                  cursorColor: kSelectedColor,
                                  autofocus: false,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                    hintText: 'Type location ...',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(bottom: 8, left: 8),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  )),
                              suggestionsCallback: (query) async {
                                if (query.isNotEmpty) {
                                  final locationResults = await widget
                                      .bloc.itgRepository
                                      .getLoaction(query);
                                  return locationResults!;
                                } else {
                                  return [];
                                }
                              },
                              onSuggestionSelected: (suggestion) {
                                setState(() {
                                  _selectedLocation =
                                      suggestion as LocationResponse;
                                  _textEditingController.text =
                                      _selectedLocation?.placeName ?? '';
                                });
                              },
                              itemBuilder: (context, itemData) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 4),
                                  child: Text((itemData as LocationResponse)
                                      .placeName!),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kSizedBoxHeight10,
              BlocConsumer(
                bloc: widget.bloc,
                listener: (_, state) {},
                buildWhen: (_, current) =>
                    (current is FetchPanchangDetailsLoadingState ||
                        current is FetchPanchangDetailsSuccessState),
                builder: (context, state) {
                  if (state is FetchPanchangDetailsLoadingState) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: (MediaQuery.of(context).size.height) / 4.5),
                      child: const Center(
                          child:
                              CircularProgressIndicator(color: kSelectedColor)),
                    );
                  } else if (state is FetchPanchangDetailsSuccessState) {
                    return PanchangDetailWidget(
                        panchangDetails: state.panchangDetails);
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                if (_selectedLocation?.placeId != null) {
                  widget.bloc.add(FetchPanchangDetailsEvent(
                      date: _selectedDate,
                      placeId: _selectedLocation!.placeId!));
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 60,
                width: 60,
                child: const Icon(Icons.search, color: Colors.white),
                decoration: const BoxDecoration(
                  color: kSelectedColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
