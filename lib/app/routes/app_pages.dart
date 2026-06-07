import 'package:get/get.dart';

import '../../features/weather/presentation/pages/weather_page.dart';
import '../../features/weather/bindings/weather_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.weather,
      page: () => const WeatherPage(),
      binding: WeatherBinding(),
    ),
  ];
}
