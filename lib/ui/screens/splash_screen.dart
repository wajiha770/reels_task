import 'package:flutter/material.dart';
import 'package:reels_task/resources/include.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/welcome.gif",
        errorBuilder: (context, error, stackTrace) => const Placeholder(
          fallbackHeight: 100,
          fallbackWidth: 100,
        ),
      )),
    );
  }
}
