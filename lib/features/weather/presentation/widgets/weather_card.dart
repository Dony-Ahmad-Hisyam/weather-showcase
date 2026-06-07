import 'package:flutter/material.dart';
import 'package:weather/app/themes/app_colors.dart';
import 'package:weather/features/weather/data/models/weather.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  final String city;

  const WeatherCard({super.key, required this.weather, required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: AppColors.secondary,

        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        children: [
          Text(
            city,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            '${weather.temperature}°C',
            style: const TextStyle(fontSize: 56, color: Colors.white),
          ),

          const SizedBox(height: 12),

          Text(
            'Humidity ${weather.humidity}%',
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
