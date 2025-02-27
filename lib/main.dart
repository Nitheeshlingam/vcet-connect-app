import 'package:flutter/material.dart';
import 'package:vcet_connect/routes/routes.dart';
import 'package:vcet_connect/services/auth_service.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/footer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final authService = AuthService();
  final appRouter = AppRouter(authService);

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vcet_connect',
      theme: ThemeData(
        primaryColor: Colors.white, // ✅ Set primary color to White
        scaffoldBackgroundColor:
            Colors.white, // ✅ Ensure all pages have a white background
        colorScheme: ColorScheme.light(
          primary: Colors.white, // ✅ Primary color White
          secondary: Colors.blue, // ✅ Secondary color Blue
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: appRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
