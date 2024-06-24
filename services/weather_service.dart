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

  Future<Weather?> getWeatherForCountry(String cityName) async {
    try {
      var response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=ea0b5144290b4f4ca6825114240402&q=sohag');
      log(response.data);

      return Weather.jSon(response.data);
    } on DioException catch (e) {
      log(e.message!);
      String errorMsg = e.response?.data ?? "error was fould, Plese try later!";
      throw errorMsg;
    } catch (e) {
      throw "error was fould, Plese try later!";
    }
  }
  // Future<Weather?> getWeatherForCountry(String cityName) async {
  //   try {
  //     Response response = await dio.get(
  //         'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/sohag?key=DXJYZ3UB49AZA87BZBFZB94D3');

  //     log(response.data['address']);

  //     return Weather.jSon(response.data);
  //   } on DioException catch (e) {
  //     log(e.message!);
  //     String errorMsg = e.response?.data ?? "error was fould, Plese try later!";
  //     throw errorMsg;
  //   } catch (e) {
  //     throw "error was fould, Plese try later!";
  //   }
  // }
}
