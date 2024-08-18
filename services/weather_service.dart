// https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/sohag?key=DXJYZ3UB49AZA87BZBFZB94D3

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wheather_app/models/weather.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline";
  final String apiKey = "DXJYZ3UB49AZA87BZBFZB94D3";
  WeatherService({required this.dio});

  Future<Weather> getWeatherForCountry(String cityName) async {
    try {
      Response response = await dio.get('$baseUrl/$cityName?key=$apiKey');
      return Weather.jSon(response.data);
    } on DioException catch (e) {
      log(e.message!);
      String errorMsg = e.response?.data ?? "error was fould, Plese try later!";
      throw errorMsg;
    } catch (e) {
      throw "error was fould, Plese try later!";
    }
  }
}
