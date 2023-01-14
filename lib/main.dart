import 'package:flutter/material.dart';
import 'package:universite_ortalama_hesapalama/constants/AppConstants.dart';

import 'AverageCalculationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Üniversite Ortalama Hesaplama",
      theme: ThemeData(
        primarySwatch: AppConstants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity // work in different environments.
      ),
      home: AverageCalculationPage(),
    );
  }
}

