import 'package:flutter/material.dart';
import 'package:vcet_connect/components/constants/gradient_text.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
            title: GradientText(
              text: 'V-Connect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              gradientColors: [Colors.blue, Colors.purple],
            ),
            leading: CircleAvatar(
              foregroundImage: AssetImage('assets/images/vcet_logo.jpg'),
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
