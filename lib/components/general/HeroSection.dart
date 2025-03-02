import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vcet_connect/components/constants/gradient_text.dart';
import 'package:vcet_connect/routes/route_names.dart';

class Herosection extends StatelessWidget {
  const Herosection({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/hero_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to VCET LMS',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                GradientText(
                  text: 'VCET',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  gradientColors: [Colors.blue, Colors.purple],
                ),
                GradientText(
                  text: 'Connect',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  gradientColors: [Colors.blue, Colors.purple],
                ),
                SizedBox(height: 24),
                Text(
                  'A comprehensive academic \nmanagement platform designed for VCET ecosystem. Streamline administrative processes, enhance communication, and maintain transparency across all departments',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    context.go(RouteNames.signIn);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Get Started ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
