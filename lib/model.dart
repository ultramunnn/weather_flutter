import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final List<WeatherForecast> forecast;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    //membuat list forecast
    final List<WeatherForecast> forecast = [];
    for (var i = 1; i <= 3; i++) {
      final index = i * 8;
      if (index < data['list'].length) {
        final forecastData = data['list'][index];
        forecast.add(WeatherForecast(
          date: forecastData['dt_txt'],
          temperature: forecastData['main']['temp'].toDouble(),
          description: forecastData['weather'][0]['description'],
          icon: forecastData['weather'][0]['icon'],
        ));
      }
    }

    return WeatherModel(
        cityName: data['city']['name'],
        temperature: double.parse(data['list'][0]['main']['temp'].toString()),
        description: data['list'][0]['weather'][0]['description'],
        icon: data['list'][0]['weather'][0]['icon'],
        forecast: forecast
        );
  }

  String get formattedTemperature {
    double tempInCelcius = temperature - 273.15;
    return '${tempInCelcius.toStringAsFixed(0)}°C';
  }

//   List<Weather> weather;
//   Main main;
//   Sys sys;

//   WeatherModel({
//     required this.weather,
//     required this.main,
//     required this.sys,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//         weather:
//             List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
//         main: Main.fromJson(json['main']),
//         sys: Sys.fromJson(json['sys']));
//   }
// }

// class Weather {
//   int id;
//   String main;
//   String description;
//   String icon;

//   Weather({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       id: json['id'],
//       main: json['main'],
//       description: json['description'],
//       icon: json['icon'],
//     );
//   }
// }

// class Main {
//   double temp;
//   double feelsLike;
//   double tempMin;
//   double tempMax;
//   int pressure;
//   int humidity;
//   int seaLevel;

//   Main({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.pressure,
//     required this.humidity,
//     required this.seaLevel,
//   });

//   factory Main.fromJson(Map<String, dynamic> json) {
//     return Main(
//       temp: json['temp'],
//       feelsLike: json['feels_like'],
//       tempMin: json['temp_min'],
//       tempMax: json['temp_max'],
//       pressure: json['pressure'],
//       humidity: json['humidity'],
//       seaLevel: json['sea_level'],
//     );
//   }
// }

// class Sys {
//   String country;
//   int sunrise;
//   int sunset;

//   Sys({
//     required this.country,
//     required this.sunrise,
//     required this.sunset,
//   });

//   factory Sys.fromJson(Map<String, dynamic> json) {
//     return Sys(
//         country: json['country'],
//         sunrise: json['sunrise'],
//         sunset: json['sunset']);
//   }
}

class WeatherForecast {
  final String date;
  final double temperature;
  final String description;
  final String icon;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  String get formattedDay {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('EEEE').format(parsedDate);
  }

  String get formattedTemperature {
    double tempInCelsius = temperature - 273.15;
    return '${tempInCelsius.toStringAsFixed(0)}°C';
  }
}
