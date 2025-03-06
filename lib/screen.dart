import 'package:flutter/material.dart';
import 'package:weather_app/model.dart';
import 'package:weather_app/client.dart';
import 'package:weather_app/screen/boxsearch.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final TextEditingController _cityController = TextEditingController();
  Future<WeatherModel>? _weatherData;

  void _searchWeather(String city) {
    if (city.isNotEmpty) {
      setState(() {
        _weatherData = WheatherClientApi.getWeather(city);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blue, // Warna latar belakang biru
              height: 500, // Tinggi container biru
              width: double.infinity, // Lebar container biru mengisi layar
              child: SearchBox(
                textEditingController: _cityController,
                onSearch: _searchWeather,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<WeatherModel?>(
              future: _weatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Terjadi kesalahan: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text('Data tidak ditemukan');
                } else {
                  final temp = snapshot.data!.main.temp;
                  return Text(
                    'Suhu: $temp°C',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
