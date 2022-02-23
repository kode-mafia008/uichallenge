import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushNamed(context, '/main/home');
    });
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}
