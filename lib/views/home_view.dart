import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return const WeatherInfoBody();
          } else {
            return const Center(
              child: Text(
                'There is no result 😔',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            );
          }
        },
      ),
      // body: const NoWeatherBody(),
    );
  }
}
