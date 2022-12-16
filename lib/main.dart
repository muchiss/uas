import 'package:flutter/material.dart';
import 'package:wicat/home_cat.dart';
import 'package:wicat/login_page.dart';
import 'package:wicat/onboarding_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //untuk menghilangkan banner debug diatas
      theme: ThemeData(),
      home: OnboardingPage(), //menjalankan class pertama kali
    );
  }
}
