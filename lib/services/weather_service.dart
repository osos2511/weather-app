import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=3e0491eccbd048bc85d185407231609&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel; //If Response Is Done
    } on DioException catch (ex) {
      //In Case An ErorrDio Occures
      final String errMessage = ex.response?.data['error']['message'] ??
          'oops there was an error,try again'; //In Case An Error Is Null, Show This Msg
      throw Exception(errMessage);
    } catch (ex) {
      log(ex.toString());
      throw Exception(
          'there was an error,try later'); //In Case An Error Non DioError
    }
  }
}
