import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/model.dart';
import 'package:http/http.dart' as http;

// static final appKey = '78b2b5857d2e450281aaac65aa161b6d';
// static final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherClientApi with ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  Future<void> fetchWeather(String name) async {
    final apiKey = '78b2b5857d2e450281aaac65aa161b6d';
    final url =
        "https://api.openweathermap.org/data/2.5/forecast?q=$name&appid=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _weather = WeatherModel.fromJson(data);
        notifyListeners();
        print(response.body);
      } else {
        Exception('Failed to fetch weather data');
      }
    } catch (e) {
      Exception('Failed to fetch weather data');
    }
  }
}
