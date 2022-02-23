import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  final String name;
  const AboutPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Text(
            'About Page ....:D.  Name is  $name',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
