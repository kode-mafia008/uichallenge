import 'package:flutter/material.dart';
import '../../widgets/home_widget.dart';
import '../../widgets/screen.dart';

class HiddenMenuAnimationScreen extends StatelessWidget {
  const HiddenMenuAnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF32121),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Screen(builder: (context) => const HomeWidget()),
      ),
    );
  }
}
