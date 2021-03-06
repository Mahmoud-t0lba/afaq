import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/src/models/models.dart';

class WeatherNotFoundException implements Exception {}

class WeatherRequestExeption implements Exception {}

class WeatherApiClient {
  WeatherApiClient({required this.apiKey, http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final String apiKey;
  final http.Client _httpClient;
  static const _baseUrl = "api.openweathermap.org";

  Future<CurrentWeatherResponse> currentWeatherByCity({required String city, String units = 'metric'}) async {
    final request = Uri.https(
      _baseUrl,
      '/data/2.5/weather',
      <String, String>{'q': city, 'appid': apiKey, 'units': units},
    );

    final response = await _httpClient.get(request);
    return _handleCurrentWeatherResponse(response);
  }

  Future<CurrentWeatherResponse> currentWeatherByCoordinates(
      Coord coord) async {
    final request = Uri.https(
      _baseUrl,
      '/data/2.5/weather',
      <String, dynamic>{
        'lat': coord.lat.toString(),
        'lon': coord.lon.toString(),
        'appid': apiKey,
        'units': 'metric'
      },
    );

    final response = await _httpClient.get(request);
    return _handleCurrentWeatherResponse(response);
  }

  Future<OnecallWeatherResponse> oneCallWeather(
      {required Coord coord, List<String> exclude = const []}) async {
    final request = Uri.https(
      _baseUrl,
      '/data/2.5/onecall',
      <String, dynamic>{
        'lat': coord.lat.toString(),
        'lon': coord.lon.toString(),
        'exclude': exclude.join(','),
        'appid': apiKey,
        'units': 'metric',
      },
    );
    final response = await _httpClient.get(request);
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      return OnecallWeatherResponse.fromJson(responseJson);
    }

    if (response.statusCode == 404) {
      throw WeatherNotFoundException();
    }
    throw WeatherRequestExeption();
  }

  String getIconUrl(String icon) {
    return 'http://openweathermap.org/img/wn/$icon@2x.png';
  }

  CurrentWeatherResponse _handleCurrentWeatherResponse(http.Response response) {
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      return CurrentWeatherResponse.fromJson(responseJson);
    }

    if (response.statusCode == 404) {
      throw WeatherNotFoundException();
    }
    throw WeatherRequestExeption();
  }
}
