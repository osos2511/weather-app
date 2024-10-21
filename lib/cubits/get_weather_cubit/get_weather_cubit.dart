//2- create cubit
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_application/models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState()); //initialState
  WeatherModel? weatherModel; //this Object (WeatherModel) get data from request

//3- create function
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessfullyState(
          weatherModel!)); //in case if data Successfully, weathermodel =data of weather
    } catch (e) {
      emit(WeatherFailureState()); //in case if data is failur
    }
  }
}
