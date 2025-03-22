import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/client.dart';
import 'package:weather_app/client.dart';
import 'package:weather_app/screen/weather_card.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherController = Provider.of<WeatherClientApi>(context);
    // Color backgroundColor ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App Mumunn', style :GoogleFonts.poppins()),
        centerTitle: true,

        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Colors.blue.shade300,
              Colors.blue.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon:
                      IconButton(onPressed: () {
                        weatherController.fetchWeather(_cityController.text);
                        print(_cityController.text);
                      }, icon: Icon(Icons.search)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              weatherController.weather != null
                  ? WeatherCard(weather: weatherController.weather!)
                  : Text('No Data', style: GoogleFonts.poppins()),
            ],
          ),
        ),
      ),
    );
  }
}