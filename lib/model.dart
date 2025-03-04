import 'package:flutter/foundation.dart';

class WeatherModel {
  List<Weather> weather;
  Main main;
  Sys sys;

  WeatherModel({
    required this.weather,
    required this.main,
    required this.sys,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        weather:
            List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json['main']),
        sys: Sys.fromJson(json['sys']));
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;
  int seaLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
    );
  }

  String toString() {
    return 'Main: {'
        'temp: $temp°C, '
        'feelsLike: $feelsLike°C, '
        'tempMin: $tempMin°C, '
        'tempMax: $tempMax°C, '
        'pressure: $pressure hPa, '
        'humidity: $humidity%}';
  }
}

class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset']);
  }
}
