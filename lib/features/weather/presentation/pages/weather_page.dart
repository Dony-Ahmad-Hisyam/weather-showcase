import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/weather_controller.dart';
import '../widgets/city_search_field.dart';
import '../widgets/weather_card.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw Exception('Test Crashlytics');
        },
        child: const Icon(Icons.warning),
      ),
      body: RefreshIndicator(
        onRefresh: controller.loadCurrentWeather,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            CitySearchField(
              controller: controller.cityController,
              onSearch: controller.searchWeather,
            ),

            const SizedBox(height: 24),

            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.weather.value == null) {
                return const Center(child: Text('No Data'));
              }

              return WeatherCard(
                city: controller.cityName.value,

                weather: controller.weather.value!,
              );
            }),
          ],
        ),
      ),
    );
  }
}
