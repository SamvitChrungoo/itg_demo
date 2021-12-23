import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itg_demo/model/astrologer_response.dart';
import 'package:itg_demo/model/panchang_request.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/provider/events/itg_events.dart';
import 'package:itg_demo/provider/repository/itg_repository.dart';
import 'package:itg_demo/provider/states/itg_states.dart';
import 'package:itg_demo/utils/helpers.dart';

class ITGBolc extends Bloc<ITGEvents, ITGStates> {
  late ITGRepository itgRepository;
  ITGBolc({required this.itgRepository}) : super(PanchangInitialLoadingState());

  List<AstrologerResponse> unmodifiedAstrologerList = [];
  int sortValue = 0;
  List<String> filteredLanguages = [];
  List<String> filteredSkills = [];

  @override
  Stream<ITGStates> mapEventToState(ITGEvents event) async* {
    if (event is FetchAstrologersEvent) {
      yield* _processFetchAstrologersEvent(event);
    } else if (event is FetchPanchangDetailsEvent) {
      yield* _processFetchPanchangDetailsEvent(event);
    } else if (event is SearchAstrologerByNameEvent) {
      yield* _processSearchAstrologerByNameEvent(event);
    } else if (event is SortAstrologersEvent) {
      yield* _processSortAstrologersEvent(event);
    } else if (event is FilterAstrologersEvent) {
      yield* _processFilterAstrologersEvent(event);
    } else if (event is ClearAstrologerByNameEvent) {
      yield FetchAstrologersSuccessState(
          astrologerList: unmodifiedAstrologerList);
    } else if (event is ClearFilterAstrologersEvent) {
      filteredLanguages = [];
      filteredSkills = [];
      yield FetchAstrologersSuccessState(
          astrologerList: unmodifiedAstrologerList);
    }
  }

  Stream<ITGStates> _processFetchAstrologersEvent(
      FetchAstrologersEvent event) async* {
    try {
      yield FetchAstrologersLoadingState();
      var response = await itgRepository.getAstrologers();
      if (unmodifiedAstrologerList.isEmpty) {
        unmodifiedAstrologerList.addAll(response!);
      }
      yield FetchAstrologersSuccessState(astrologerList: response ?? []);
    } on Exception catch (e) {
      yield FetchAstrologersErrorState(errorMessage: e.toString());
    }
  }

  Stream<ITGStates> _processFetchPanchangDetailsEvent(
      FetchPanchangDetailsEvent event) async* {
    try {
      yield FetchPanchangDetailsLoadingState();
      var response = await itgRepository.getPanchangDetails(PanchangRequest(
          day: event.date.day,
          month: event.date.month,
          year: event.date.year,
          placeId: event.placeId));
      yield FetchPanchangDetailsSuccessState(
          panchangDetails: response ?? PanchangResponse());
    } on Exception catch (e) {
      yield FetchPanchangDetailsErrorState(errorMessage: e.toString());
    }
  }

  Stream<ITGStates> _processFilterAstrologersEvent(
      FilterAstrologersEvent event) async* {
    try {
      yield IntermediateAstrologerState();
      sortValue = 0;
      filteredLanguages = event.languages;
      filteredSkills = event.skills;
      var filteredAstrologers = <AstrologerResponse>[];

      for (var element in unmodifiedAstrologerList) {
        bool addToFilter = true;
        var languages = element.languages?.map((e) => e.name).toList();
        var skills = element.skills?.map((e) => e.name).toList();
        if (event.languages.isNotEmpty) {
          for (var x in event.languages) {
            if (!languages!.contains(x)) {
              addToFilter = false;
            }
          }
        }
        if (event.skills.isNotEmpty) {
          for (var x in event.skills) {
            if (!skills!.contains(x)) {
              addToFilter = false;
            }
          }
        }
        if (addToFilter) {
          filteredAstrologers.add(element);
        }
      }

      yield FetchAstrologersSuccessState(astrologerList: filteredAstrologers);
    } on Exception catch (e) {
      yield FetchAstrologersErrorState(errorMessage: e.toString());
    }
  }

  Stream<ITGStates> _processSearchAstrologerByNameEvent(
      SearchAstrologerByNameEvent event) async* {
    try {
      sortValue = 0;
      var filteredAstrologer = <AstrologerResponse>[];
      for (var x in unmodifiedAstrologerList) {
        var name = getName(x);
        if (name.toLowerCase().contains(event.name)) {
          filteredAstrologer.add(x);
        }
      }
      yield FetchAstrologersSuccessState(astrologerList: filteredAstrologer);
    } on Exception catch (e) {
      yield FetchPanchangDetailsErrorState(errorMessage: e.toString());
    }
  }

  Stream<ITGStates> _processSortAstrologersEvent(
      SortAstrologersEvent event) async* {
    try {
      yield IntermediateAstrologerState();
      var sortedAstrologer = unmodifiedAstrologerList;
      switch (event.sortValue) {
        case 1:
          sortedAstrologer
              .sort((a, b) => b.experience!.compareTo(a.experience!));
          sortValue = 1;
          break;
        case 2:
          sortedAstrologer
              .sort((a, b) => a.experience!.compareTo(b.experience!));
          sortValue = 2;

          break;
        case 3:
          sortedAstrologer.sort((a, b) => b.additionalPerMinuteCharges!
              .compareTo(a.additionalPerMinuteCharges!));
          sortValue = 3;

          break;
        case 4:
          sortedAstrologer.sort((a, b) => a.additionalPerMinuteCharges!
              .compareTo(b.additionalPerMinuteCharges!));
          sortValue = 4;

          break;
        default:
      }
      yield FetchAstrologersSuccessState(astrologerList: sortedAstrologer);
    } on Exception catch (e) {
      yield FetchAstrologersErrorState(errorMessage: e.toString());
    }
  }
}
