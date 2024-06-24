import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wheather_app/models/weather.dart';
import 'package:wheather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Search City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value)async {
              Weather? weather = await WeatherService(dio: Dio()).getWeatherForCountry(value);
              log(weather!.cityName);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "Enter your name",
              label: const Text("Search"),
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
