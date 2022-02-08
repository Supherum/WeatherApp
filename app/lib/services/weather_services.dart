import 'dart:convert';

import 'package:app/models/response/current_weather_response.dart';
import 'package:app/models/response/forecast_weather_response.dart';

import 'package:http/http.dart' as http;

class WeatherServices {

  static const String _API_KEY = "8d699680216aea56f94ca876d7d69eb2";

  Future<CurrentWeatherResponse> getCurrentWeaher(
      String lat, String lon) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_API_KEY&units=metric'));

    if (response.statusCode == 200) {
      return CurrentWeatherResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('The weather could not be load susscessuflly');
    }
  }

  Future<ForeCastResponse> getForecast(String lat, String lon) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$_API_KEY&units=metric"));

    if (response.statusCode == 200) {
      return ForeCastResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('ForeCast could not be load successfully');
    }
  }
}
