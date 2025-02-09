import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scanner_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>  HomeScreen()));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset('assets/lottie/splash.json', fit: BoxFit.cover, width: double.infinity),
    );
  }
}
