// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:itg_demo/model/astrologer_response.dart';
import 'package:itg_demo/model/location_response.dart';
import 'package:itg_demo/model/panchang_request.dart';
import 'package:itg_demo/model/panchang_response.dart';
import 'package:itg_demo/provider/repository/api_client.dart';

class ITGRepository {
  final String? baseURL;
  late ApiClient _apiClient;

  ITGRepository({this.baseURL}) {
    final dio = Dio();
    _apiClient = ApiClient(dio, baseUrl: baseURL!);
  }
  Future<List<AstrologerResponse>?> getAstrologers() async {
    try {
      final response = await _apiClient.getAstrologers();
      final data = List<AstrologerResponse>.from(
          response['data'].map((x) => AstrologerResponse.fromJson(x)));
      return data;
    } on Exception catch (e) {
      print('Error ------ $e');
    }
  }

  Future<List<LocationResponse>?> getLoaction(String inputPlace) async {
    try {
      final response = await _apiClient.getLoaction(inputPlace: inputPlace);
      final data = List<LocationResponse>.from(
          response['data'].map((x) => LocationResponse.fromJson(x)));
      return data;
    } on Exception catch (e) {
      print('Error ------ $e');
    }
  }

  Future<PanchangResponse?> getPanchangDetails(
      PanchangRequest panchangRequest) async {
    try {
      final response = await _apiClient.getPanchangDetails(panchangRequest);
      final data = PanchangResponse.fromJson(response['data']);
      return data;
    } on Exception catch (e) {
      print('Error ------ $e');
    }
  }
}
