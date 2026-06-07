import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsService {
  Future<void> recordError(Object error, StackTrace stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  void testCrash() {
    throw Exception('Manual Crash Test');
  }
}
