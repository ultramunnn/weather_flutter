import 'package:flutter/material.dart';
import 'package:weather_app/client.dart';
import 'package:weather_app/model.dart';
import 'package:weather_app/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}
