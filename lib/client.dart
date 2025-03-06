import 'dart:convert';

import 'package:weather_app/model.dart';
import 'package:dio/dio.dart';

class WheatherClientApi {
  static final appKey = '78b2b5857d2e450281aaac65aa161b6d';
  static final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<WeatherModel> getWeather(String city) async {
    Response response = await Dio().get('$baseUrl?q=$city&appid=$appKey');

    try {
      if (response.statusCode == 200) {
        final data = response.data;
        return WeatherModel.fromJson(data);
      } else {
        throw Exception('Gagal mengambil data ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan $e');
    }
  }
}
