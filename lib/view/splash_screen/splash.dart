import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
            0.1,
            0.4,
            0.6,
            0.9,
          ],
              colors: [
            Colors.yellow.shade200,
            Colors.red.shade400,
            Colors.indigo.shade300,
            Colors.teal.shade50,
          ])),
      child: Column(
        children: [Expanded(child: Lottie.asset('asset/splash.json'))],
      ),
    ));
  }
}
