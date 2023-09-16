import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required currentCity}) async {
    try {
      Response response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=4d6d868667b743cca7b194330230809&q=$currentCity&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try again';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try again');
    }
  }
}
