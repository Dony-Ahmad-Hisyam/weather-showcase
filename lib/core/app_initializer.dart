import 'services/notification_service.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    final notificationService = NotificationService();

    await notificationService.initialize();
  }
}
