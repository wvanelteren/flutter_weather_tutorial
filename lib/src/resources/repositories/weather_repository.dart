import 'dart:async';

import 'package:meta/meta.dart';

import '../data_provider/weather_api_client.dart';
import '../../models/weather_model.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
    : assert (WeatherApiClient != null);
  
  Future<Weather> getWeather(String city) async {
    final int _locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(_locationId);
  }

}