import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cupits/get_weather_cupit/get_weather_states.dart';
import 'package:wheather_app/models/weather.dart';

import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit():super(InitialState());
  late Weather weather ;
  getWeather({required String cityName}) async {
   
   try {
  weather = await WeatherService(dio: Dio()).getWeatherForCountry(cityName);
  emit(WeatherLoadedStete());
} catch (e) {
  emit(WeatherFailtureStete());
}
  
  }
}
