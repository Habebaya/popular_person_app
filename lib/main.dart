import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task/business_logic/popular_person_provider.dart';
import 'package:task/presentation/screens/popularPersonScreen/popular_person_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (BuildContext context) => PopularPersonProvider()),
  ], child:  DevicePreview(
    builder: (BuildContext context) => const MyApp(),
    enabled: !kReleaseMode,
  ),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),

        builder: DevicePreview.appBuilder,

        theme: ThemeData(
          primaryColor: Colors.black
        ),
        home: const PopularPersonScreen());
  }
}
