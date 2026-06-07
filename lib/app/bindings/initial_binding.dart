import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather/core/services/crashlytics_service.dart';
import 'package:weather/core/services/notification_service.dart';

import '../../core/network/dio_client.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(DioClient().dio, permanent: true);

    Get.put(NotificationService(), permanent: true);

    Get.put(CrashlyticsService(), permanent: true);
  }
}
