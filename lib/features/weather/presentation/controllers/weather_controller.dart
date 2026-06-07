import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/features/weather/data/models/weather.dart';
import '../../../../core/services/notification_service.dart';
import '../../data/repositories/weather_repository.dart';

class WeatherController extends GetxController {
  final WeatherRepository repository;

  final NotificationService notificationService;

  WeatherController(this.repository, this.notificationService);

  final isLoading = false.obs;

  final weather = Rxn<WeatherModel>();

  final errorMessage = ''.obs;
  final cityController = TextEditingController();
  final cityName = 'Surabaya'.obs;

  @override
  void onInit() {
    super.onInit();

    loadCurrentWeather();
  }

  Future<void> loadCurrentWeather() async {
    try {
      isLoading.value = true;

      weather.value = await repository.getCurrentLocationWeather();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchWeather() async {
    try {
      isLoading.value = true;

      final result = await repository.searchWeather(cityController.text);

      cityName.value = cityController.text;

      weather.value = result;
    } catch (e) {
      Get.snackbar('Error', 'City not found');
    } finally {
      isLoading.value = false;
    }
  }
}
