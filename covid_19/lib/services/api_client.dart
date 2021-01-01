import 'package:covid_19/model/statedistrict.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../model/data.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.covid19india.org/")
abstract class ApiClient{

  factory ApiClient(Dio dio,{String baseUrl}){
    dio.options = BaseOptions(receiveTimeout: 15000, connectTimeout: 15000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/data.json")
  Future<Data> getStatewiseData();

  @GET("v2/state_district_wise.json")
  Future<List<StateDistrict>> getDistrictwiseData();

}