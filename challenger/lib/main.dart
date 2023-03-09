import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_challenger/app/app.locator.dart';
import 'package:game_challenger/app/app.router.dart';
import 'package:game_challenger/app/app_themes.dart';
import 'package:game_challenger/core/services/navigation/navigation_service.dart';
import 'package:game_challenger/utils/constants.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

bool useEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

    setupLocator();

  String host = Platform.isAndroid ? '10.0.2.2' : "localhost";

  if(useEmulator){
    db.useFirestoreEmulator(host, 8080);
    db.settings = const Settings(
      persistenceEnabled: false
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quizbee - Challenger',
      theme: AppThemes.light,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      onInit: () async {

      },
    );
  }
}