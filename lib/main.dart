import 'package:flutter/material.dart';
import 'package:weather_app/client.dart';
import 'package:weather_app/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WheaterApp(),
    );
  }
}

class WheaterApp extends StatefulWidget {
  const WheaterApp({super.key});

  @override
  State<WheaterApp> createState() => _WheaterAppState();
}

class _WheaterAppState extends State<WheaterApp> {
  @override
  WeatherModel? weather;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                print("HALO TIMUN");

                weather = await WheatherClientApi().request();
                print(weather?.main);
              },
              child: Text('Get Data'),
            )
          ],
        ),
      )),
    );
  }
}
