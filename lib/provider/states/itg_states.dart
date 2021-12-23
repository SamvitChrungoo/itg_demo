import 'package:equatable/equatable.dart';
import 'package:itg_demo/model/astrologer_response.dart';
import 'package:itg_demo/model/panchang_response.dart';

abstract class ITGStates extends Equatable {}

class PanchangInitialLoadingState extends ITGStates {
  @override
  List<Object?> get props => [];
}

class FetchAstrologersLoadingState extends ITGStates {
  @override
  List<Object?> get props => [];
}

class FetchAstrologersSuccessState extends ITGStates {
  final List<AstrologerResponse> astrologerList;
  FetchAstrologersSuccessState({required this.astrologerList});

  @override
  List<Object> get props => [astrologerList];
}

class FetchAstrologersErrorState extends ITGStates {
  final String errorMessage;
  FetchAstrologersErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class FetchPanchangDetailsLoadingState extends ITGStates {
  @override
  List<Object?> get props => [];
}

class FetchPanchangDetailsErrorState extends ITGStates {
  final String errorMessage;
  FetchPanchangDetailsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class FetchPanchangDetailsSuccessState extends ITGStates {
  final PanchangResponse panchangDetails;
  FetchPanchangDetailsSuccessState({required this.panchangDetails});

  @override
  List<Object?> get props => [panchangDetails];
}

class IntermediateAstrologerState extends ITGStates {
  @override
  List<Object?> get props => [];
}
