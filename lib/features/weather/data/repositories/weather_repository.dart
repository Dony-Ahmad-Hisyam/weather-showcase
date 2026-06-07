import 'package:weather/features/weather/data/models/weather.dart';

import '../services/location_service.dart';
import '../services/weather_service.dart';

class WeatherRepository {
  final WeatherService weatherService;
  final LocationService locationService;

  WeatherRepository(this.weatherService, this.locationService);

  Future<WeatherModel> getCurrentLocationWeather() async {
    final position = await locationService.getCurrentPosition();

    final response = await weatherService.getWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    return WeatherModel.fromJson(response);
  }

  Future<WeatherModel> searchWeather(String city) async {
    final cityResponse = await weatherService.searchCity(city);

    final result = cityResponse['results'][0];

    final weatherResponse = await weatherService.getWeather(
      latitude: result['latitude'],
      longitude: result['longitude'],
    );

    return WeatherModel.fromJson(weatherResponse);
  }
}
