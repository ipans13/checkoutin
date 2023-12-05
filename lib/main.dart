import 'package:flutter/material.dart';
import 'package:checkoutin/page_login.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple, // Mengatur warna utama aplikasi
      ),
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('lib/images/logo.png',
        height: 100,
        width: 100,
        ), 
      ),
    );
  }
}