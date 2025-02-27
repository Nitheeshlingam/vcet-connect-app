import 'package:flutter/material.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/sidebar.dart';

class WardDetails extends StatelessWidget {
  const WardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: SidebarDrawer(),
      body: Center(child: Text('Wards Detail Page')),
    );
  }
}
