import 'package:ask_42/home_page.dart';
import 'package:ask_42/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Palette.backGroundColor,
          appBarTheme: AppBarTheme(color: Palette.backGroundColor)),
      title: 'Ask 42',
      home: const HomePage(),
    );
  }
}
