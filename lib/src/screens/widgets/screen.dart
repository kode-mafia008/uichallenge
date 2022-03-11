import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final Function builder;
  const Screen({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [],
    );
  }
}
