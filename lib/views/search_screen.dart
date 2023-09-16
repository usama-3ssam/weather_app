// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/states.dart';
import '../cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 30,
                      ),
                      hintText: 'enter your city',
                      suffixIcon: Icon(
                        Icons.search,
                      ),
                      labelText: 'City',
                    ),
                    onSubmitted: (value) async {
                      BlocProvider.of<GetWeatherCubit>(context)
                          .getWeather(cityName: value);
                      Navigator.pop(context);
                      // log(BlocProvider.of<GetWeatherCubit>(context)
                      //     .weatherModel!
                      //     .cityName);
                      // log(BlocProvider.of<GetWeatherCubit>(context)
                      //     .weatherModel!
                      //     .maxTemp);
                      // log(BlocProvider.of<GetWeatherCubit>(context)
                      //     .weatherModel!
                      //     .minTemp);
                      // log(BlocProvider.of<GetWeatherCubit>(context)
                      //     .weatherModel!
                      //     .date);
                      // log(BlocProvider.of<GetWeatherCubit>(context)
                      //     .weatherModel!
                      //     .weatherCondition);
                      // Navigator.pop(context);
                    },
                    keyboardType: TextInputType.text,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
