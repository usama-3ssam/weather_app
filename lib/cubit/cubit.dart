import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states.dart';
import '../models/weather_model.dart';
import '../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;

  GetWeatherCubit() : super(InitialState());

  getWeather({required cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(currentCity: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
