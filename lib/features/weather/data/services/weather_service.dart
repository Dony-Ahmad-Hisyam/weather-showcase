import 'package:dio/dio.dart';
import 'package:weather/core/network/api_endpoint.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<Map<String, dynamic>> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await dio.get(
      ApiEndpoints.weather,
      queryParameters: {
        "latitude": latitude,
        "longitude": longitude,
        "current": "temperature_2m,relative_humidity_2m,weather_code",
      },
    );

    return response.data;
  }

  Future<Map<String, dynamic>> searchCity(String city) async {
    final response = await dio.get(
      ApiEndpoints.geocoding,
      queryParameters: {'name': city, 'count': 10},
    );

    return response.data;
  }
}
