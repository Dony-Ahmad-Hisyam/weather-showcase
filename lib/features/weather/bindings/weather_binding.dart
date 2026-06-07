import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../data/services/location_service.dart';

import '../data/repositories/weather_repository.dart';
import '../data/services/weather_service.dart';
import 'package:weather/core/services/notification_service.dart';
import '../presentation/controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherService(Get.find<Dio>()));

    Get.lazyPut(() => LocationService());

    Get.lazyPut(
      () => WeatherRepository(
        Get.find<WeatherService>(),
        Get.find<LocationService>(),
      ),
    );

    Get.lazyPut(
      () => WeatherController(
        Get.find<WeatherRepository>(),
        Get.find<NotificationService>(),
      ),
    );
  }
}
