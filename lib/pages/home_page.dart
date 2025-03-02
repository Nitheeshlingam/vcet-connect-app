import 'package:flutter/material.dart';
import 'package:vcet_connect/components/general/HeroSection.dart';
import 'package:vcet_connect/components/general/footer.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/sidebar.dart';
import 'package:vcet_connect/pages/about.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: SidebarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Herosection(),
            About(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
