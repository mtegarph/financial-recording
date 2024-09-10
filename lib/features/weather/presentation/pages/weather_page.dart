import 'package:financial_recording/core/widget/stateful_observed_builder.dart';
import 'package:financial_recording/features/weather/presentation/bloc/get_weather_bloc/get_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});
  void _resumeSession(BuildContext context) {
    //  final session = context.read<GetWeatherBloc>().state;
    context.read<GetWeatherBloc>().add(const GetWeatherEvent.getLocation());
  }

  @override
  Widget build(BuildContext context) {
    return StatefulObservedBuilder(
      afterBuild: () {
        _resumeSession(context);
      },
      didChangeAppLifecycleState: (context, setState, state) {
        switch (state) {
          case AppLifecycleState.resumed:
            _resumeSession(context);
            break;
          default:
        }
      },
      builder: (context, setState) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Weather Page'),
            ),
            body: BlocBuilder<GetWeatherBloc, GetWeatherState>(
              buildWhen: (previous, current) =>
                  (previous.lat != current.lat) ||
                  (previous.long != current.long),
              builder: (context, state) {
                if (state.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.weather.isSome()) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.weather.fold(
                            () => 'No weather data',
                            (a) => a.currentWeather!.temperature.toString(),
                          ),
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(state.lat.toString()),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(state.long.toString()),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No weather data'),
                  );
                }
              },
            ));
      },
    );
  }
}
