import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task/business_logic/popular_person_provider.dart';
import 'package:task/presentation/screens/popularPersonScreen/popular_person_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (BuildContext context) => PopularPersonProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PopularPersonScreen());
  }
}
