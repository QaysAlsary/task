
import 'package:flutter/material.dart';
import 'services_locator.dart';

abstract class AppInitializer {
  static init() async {
    /// because binding should be initialized before calling runApp.
    WidgetsFlutterBinding.ensureInitialized();


    /// initialize routing
   // AppRouter.init();

    /// dependencies injection
    await ServicesLocator.setup();


  }
}
