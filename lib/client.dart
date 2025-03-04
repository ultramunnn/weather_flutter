import 'dart:convert';

import 'package:weather_app/model.dart';
import 'package:dio/dio.dart';

class WheatherClientApi {
  Future<WeatherModel> request() async {
    String appKey = '78b2b5857d2e450281aaac65aa161b6d';
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=malang&appid=78b2b5857d2e450281aaac65aa161b6d";
    Response response = await Dio().get(url);

    final parsedData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parsedData);

    return weather;
  }
}
