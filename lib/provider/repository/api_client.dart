import 'package:itg_demo/model/panchang_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://www.astrotak.com/astroapi/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("agent/all")
  Future<dynamic> getAstrologers();

  @GET("location/place")
  Future<dynamic> getLoaction({
    @Query('inputPlace') required String inputPlace,
  });

  @POST('horoscope/daily/panchang')
  Future<dynamic> getPanchangDetails(
    @Body() PanchangRequest panchangRequest,
  );
}
