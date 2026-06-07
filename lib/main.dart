import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather/app/bindings/initial_binding.dart';
import 'package:weather/app/routes/app_pages.dart';
import 'package:weather/app/routes/app_routes.dart';
import 'package:weather/app/themes/themes.dart';
import 'package:weather/config/env.dart';
import 'package:weather/core/app_initializer.dart';
import 'package:weather/core/firebase/firebase_background_handler.dart';
import 'package:weather/core/firebase/firebase_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await FirebaseInitializer.initialize();
  await AppInitializer.initialize();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

  debugPrint('Firebase apps: ${Firebase.apps}');
  debugPrint('Firebase app: ${Firebase.app().name}');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Env.appName,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      initialBinding: InitialBinding(),
      initialRoute: Routes.weather,
      getPages: AppPages.routes,
    );
  }
}
