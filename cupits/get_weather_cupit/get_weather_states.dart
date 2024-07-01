import 'package:wheather_app/models/weather.dart';

class WeatherState{
  
}
class InitialState extends WeatherState{

}
class WeatherLoadedStete extends WeatherState{
  final Weather weather;

  WeatherLoadedStete({required this.weather});
}
class WeatherFailtureStete extends WeatherState{
  
}
