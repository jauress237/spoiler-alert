import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtest/pages/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(9, 136, 20, 20),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPOILER ALERT',
      home: HomePage(),
    );
  }
}
