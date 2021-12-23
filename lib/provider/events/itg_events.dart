import 'package:equatable/equatable.dart';

abstract class ITGEvents extends Equatable {}

class FetchAstrologersEvent extends ITGEvents {
  @override
  List<Object?> get props => [];
}

class FetchPanchangDetailsEvent extends ITGEvents {
  final DateTime date;
  final String placeId;

  FetchPanchangDetailsEvent({required this.date, required this.placeId});
  @override
  List<Object?> get props => [date, placeId];
}

class SearchAstrologerByNameEvent extends ITGEvents {
  final String name;

  SearchAstrologerByNameEvent(this.name);
  @override
  List<Object?> get props => [name];
}

class ClearAstrologerByNameEvent extends ITGEvents {
  @override
  List<Object?> get props => [];
}

class SortAstrologersEvent extends ITGEvents {
  final int sortValue;

  SortAstrologersEvent(this.sortValue);
  @override
  List<Object?> get props => [sortValue];
}

class FilterAstrologersEvent extends ITGEvents {
  final List<String> languages;
  final List<String> skills;

  FilterAstrologersEvent({required this.languages, required this.skills});
  @override
  List<Object?> get props => [languages, skills];
}

class ClearFilterAstrologersEvent extends ITGEvents {
  @override
  List<Object?> get props => [];
}
