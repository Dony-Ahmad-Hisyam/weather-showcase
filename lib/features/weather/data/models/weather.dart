class WeatherModel {
  final double temperature;
  final int humidity;
  final int weatherCode;

  WeatherModel({
    required this.temperature,
    required this.humidity,
    required this.weatherCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'];

    return WeatherModel(
      temperature: (current['temperature_2m'] as num).toDouble(),

      humidity: current['relative_humidity_2m'] ?? 0,

      weatherCode: current['weather_code'] ?? 0,
    );
  }
}
