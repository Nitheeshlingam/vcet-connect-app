import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Widget child;

  const GradientWidget({
    Key? key,
    required this.color1,
    required this.color2,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
