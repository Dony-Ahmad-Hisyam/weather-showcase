import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get appName => dotenv.env['APP_NAME'] ?? '';

  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static String get weatherEndpoint => dotenv.env['WEATHER_ENDPOINT'] ?? '';

  static String get geocodingBaseUrl => dotenv.env['GEOCODING_BASE_URL'] ?? '';
  static String get geocodingEndpoint => dotenv.env['GEOCODING_ENDPOINT'] ?? '';
}
