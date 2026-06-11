import 'package:flutter/material.dart';
import 'package:tikitiki/views/home.dart';

void main() {
  runApp(const TikiTikiApp());
}

class TikiTikiApp extends StatelessWidget {
  const TikiTikiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikiTiki',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF1493),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF1493),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
