import '../../config/env.dart';

class ApiEndpoints {
  static String get weather => '${Env.baseUrl}${Env.weatherEndpoint}';
  static String get geocoding =>
      '${Env.geocodingBaseUrl}${Env.geocodingEndpoint}';
}
