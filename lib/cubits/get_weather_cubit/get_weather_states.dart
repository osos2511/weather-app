//1- create states
import 'package:weather_application/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherSuccessfullyState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessfullyState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {}
