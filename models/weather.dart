import 'package:intl/intl.dart';

DateFormat formatter = DateFormat.Hm();
String timeNow = formatter.format(DateTime.now());
double _getCelsius(double f) {
  return f - 17.6666667;
}

class Weather {
  final String weatherCondition;
  final String cityName;
  String? image;
  String date;
  final double temp;
  final double maxTemp;
  final double minTemp;

  Weather({
    required this.weatherCondition,
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    this.image,
  });
  factory Weather.jSon(jSon) {
    return Weather(
      weatherCondition: jSon['days'][0]['conditions'],
      cityName: jSon['address'],
      date: timeNow,
      temp: _getCelsius(jSon['days'][0]['temp']),
      maxTemp: _getCelsius(jSon['days'][0]['tempmax']),
      minTemp: _getCelsius(jSon['days'][0]['tempmin']),
    );
  }
}
