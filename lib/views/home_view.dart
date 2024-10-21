import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_application/views/search_view.dart';
import 'package:weather_application/widgets/no_weather_body.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        //5- integrate cubit
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return NoWeatherBody();
            } else if (state is WeatherSuccessfullyState) {
              return WeatherInfoBody(
                weather: state.weatherModel,
              );
            } else {
              return Text('There was an error');
            }
          },
        ),
      ),
    );
  }
}
