import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:space_rumble/ISS/Models/AstrosResponse.dart';
import 'package:space_rumble/ISS/Models/IssNowResponse.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "http://api.open-notify.org/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('iss-now.json')
  Future<IssNowResponse> getIssNow();

  @GET('astros.json')
  Future<AstrosResponse> getAstros();
}