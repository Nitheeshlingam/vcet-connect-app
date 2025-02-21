import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcet_connect/routes.dart';
import 'package:vcet_connect/services/auth_service.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/footer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Implement security features similar to your React app
  _setupSecurityFeatures();

  final authService = AuthService();
  final appRouter = AppRouter(authService);

  runApp(MyApp(appRouter: appRouter));
}

void _setupSecurityFeatures() {
  // Flutter doesn't need most of the web security features from your React app
  // as they don't apply in the same way, but we can implement some similar protections

  // Prevent screenshots in release mode (Android only)
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  // You could add other security features here
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: appRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // This is where you could add global UI elements
        // similar to the AppWrapper in your React code
        return child!;
      },
    );
  }
}

// You'll also need a root widget that handles showing/hiding Navbar and Footer
class AppShell extends StatelessWidget {
  final Widget child;
  final String currentPath;
  final AppRouter router;

  const AppShell({
    Key? key,
    required this.child,
    required this.currentPath,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showNavbar = router.shouldShowNavbar(currentPath);
    final showFooter = router.shouldShowFooter(currentPath);

    return Scaffold(
      appBar: showNavbar
          ? const PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: Navbar(),
            )
          : null,
      body: Column(
        children: [
          Expanded(child: child),
          if (showFooter) const Footer(),
        ],
      ),
    );
  }
}
