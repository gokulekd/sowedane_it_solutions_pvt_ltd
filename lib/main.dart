import 'package:flutter/material.dart';
import 'package:sowedane_it_solutions_pvt_ltd/view/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ScreenSplash(),
    );
  }
}
