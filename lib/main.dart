import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

// App root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile Card App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
