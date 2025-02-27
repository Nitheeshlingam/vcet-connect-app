import 'package:flutter/material.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/sidebar.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: SidebarDrawer(),
      body: Center(child: Text('SignIn page')),
    );
  }
}
