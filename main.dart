import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cupits/get_weather_cupit/get_weather_cubit.dart';
import 'package:wheather_app/cupits/get_weather_cupit/get_weather_states.dart';
import 'package:wheather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              MaterialColor color = getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weather
                      ?.weatherCondition);
              ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: color);
              return MaterialApp(
                theme: ThemeData(
                  brightness: Brightness.light,
                  colorScheme: colorScheme,
                  useMaterial3: true,
                  appBarTheme: AppBarTheme.of(context).copyWith(
                      backgroundColor: colorScheme.primary,
                      titleTextStyle:
                          TextStyle(color: colorScheme.onPrimary, fontSize: 24),
                      actionsIconTheme: IconTheme.of(context)
                          .copyWith(color: colorScheme.onPrimary)),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            },
          );
        }));
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  if (weatherCondition.toLowerCase().contains("rain")) {
    return Colors.blueGrey;
  } else if (weatherCondition.toLowerCase().contains("snow")) {
    return Colors.lightBlue;
  } else if (weatherCondition.toLowerCase().contains("cloud")) {
    return Colors.grey;
  } else if (weatherCondition.toLowerCase().contains("clear")) {
    return Colors.orange;
  } else {
    return Colors.lightGreen;
  }
}
