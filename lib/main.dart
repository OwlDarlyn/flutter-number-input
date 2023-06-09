import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group_test_assignment/provider/countries_provider.dart';

import '../screens/get_started_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Countries())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black),
      ),
      home: const GetStartedScreen(),
    );
  }
}
