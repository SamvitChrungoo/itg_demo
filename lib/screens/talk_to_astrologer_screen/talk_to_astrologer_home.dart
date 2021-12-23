// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itg_demo/provider/bloc/itg_bloc.dart';
import 'package:itg_demo/provider/events/itg_events.dart';
import 'package:itg_demo/provider/states/itg_states.dart';
import 'package:itg_demo/screens/talk_to_astrologer_screen/widgets/astrologer_card.dart';
import 'package:itg_demo/screens/talk_to_astrologer_screen/widgets/astrologer_filter_dialog.dart';
import 'package:itg_demo/utils/constants.dart';
import 'package:itg_demo/widgets/common_icon.dart';

class TalkToAstrologerScreen extends StatefulWidget {
  const TalkToAstrologerScreen({required this.bloc, Key? key})
      : super(key: key);
  final ITGBolc bloc;

  @override
  _TalkToAstrologerScreenState createState() => _TalkToAstrologerScreenState();
}

class _TalkToAstrologerScreenState extends State<TalkToAstrologerScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.add(FetchAstrologersEvent());
    super.initState();
  }

  bool _enableSearch = false;
  final TextEditingController _searchController = TextEditingController();

  final _sortOptions = [
    SortOptions('', 0),
    SortOptions('Experience- high to low', 1),
    SortOptions('Experience- low to high', 2),
    SortOptions('Price- high to low', 3),
    SortOptions('Price- low to high', 4),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer(
      bloc: widget.bloc,
      listener: (_, state) {},
      buildWhen: (_, current) => (current is FetchAstrologersLoadingState ||
          current is FetchAstrologersErrorState ||
          current is FetchAstrologersSuccessState),
      builder: (context, state) {
        if (state is FetchAstrologersLoadingState) {
          return const Center(
              child: CircularProgressIndicator(color: kSelectedColor));
        } else if (state is FetchAstrologersSuccessState) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Text('Talk to an Astrologer',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    CommonIcon(
                        asset: kSearchIcon,
                        onTap: () {
                          setState(() {
                            _enableSearch = !_enableSearch;
                          });
                        },
                        height: 24),
                    kSizedBoxWidth10,
                    CommonIcon(
                        asset: kFiltercon,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AstrologerFilterDialog(
                                    bloc: widget.bloc);
                              },
                              useSafeArea: false);
                        },
                        height: 24),
                    kSizedBoxWidth10,
                    PopupMenuButton(
                        offset: const Offset(0.0, 40.0),
                        child: IgnorePointer(
                          child: CommonIcon(
                              asset: kSortIcon, onTap: () {}, height: 24),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        onSelected: (val) {
                          widget.bloc.add(ClearFilterAstrologersEvent());
                          widget.bloc.add(SortAstrologersEvent(val as int));
                        },
                        itemBuilder: (context) => [
                              ..._sortOptions
                                  .map((SortOptions e) => e.value == 0
                                      ? PopupMenuItem(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Sort By',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: kSelectedColor)),
                                              kSizedBoxHeight6,
                                              Container(
                                                  height: 0.5,
                                                  color: Colors.grey)
                                            ],
                                          ),
                                          enabled: false,
                                          value: e.value)
                                      : PopupMenuItem(
                                          height: 40,
                                          child: Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: e.value !=
                                                        widget.bloc.sortValue
                                                    ? null
                                                    : Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: kSelectedColor,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              kSizedBoxWidth10,
                                              Text(e.name),
                                            ],
                                          ),
                                          value: e.value,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                        ))
                                  .toList()
                            ]),
                  ],
                ),
              ),
              if (_enableSearch) ...[
                kSizedBoxHeight10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Colors.grey[200],
                    child: TextField(
                        controller: _searchController,
                        cursorColor: kSelectedColor,
                        autofocus: false,
                        onChanged: (text) {
                          widget.bloc.add(ClearFilterAstrologersEvent());
                          widget.bloc.add(
                              SearchAstrologerByNameEvent(text.toLowerCase()));
                        },
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.search, color: kSelectedColor),
                          suffixIcon: InkWell(
                              onTap: () {
                                widget.bloc.add(ClearAstrologerByNameEvent());
                                setState(() {
                                  _searchController.clear();
                                  _enableSearch = !_enableSearch;
                                });
                              },
                              child: const Icon(Icons.close,
                                  color: kSelectedColor)),
                          hintText: 'Search astrologer ...',
                          contentPadding: const EdgeInsets.only(top: 15),
                          hintStyle:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        )),
                  ),
                ),
              ],
              kSizedBoxHeight10,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(color: Colors.grey[500], height: 0.5);
                    },
                    itemCount: state.astrologerList.length,
                    itemBuilder: (context, index) {
                      return AstrolgerCard(state.astrologerList[index]);
                    },
                  ),
                ),
              )
            ],
          );
        } else if (state is FetchAstrologersErrorState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SortOptions {
  final String name;
  final int value;
  SortOptions(this.name, this.value);
}
