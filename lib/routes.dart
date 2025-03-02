import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vcet_connect/pages/home_page.dart';
import 'package:vcet_connect/pages/super_admin.dart';
import 'package:vcet_connect/pages/staff_dashboard.dart';
import 'package:vcet_connect/pages/hod_dashboard.dart';
import 'package:vcet_connect/pages/student_dashboard.dart';
import 'package:vcet_connect/pages/profile_page.dart';
import 'package:vcet_connect/pages/page_not_found.dart';
import 'package:vcet_connect/pages/ward_details.dart';
import 'package:vcet_connect/pages/about.dart';
import 'package:vcet_connect/pages/forgot_password.dart';
import 'package:vcet_connect/components/auth/sign_in.dart';
import 'package:vcet_connect/components/systems/leave/leave_request_form.dart';
import 'package:vcet_connect/components/systems/bonafieds/bonafied_request_form.dart';
import 'package:vcet_connect/components/systems/mail_timing.dart';
import 'package:vcet_connect/services/auth_service.dart';

class AppRouter {
  final AuthService authService;

  AppRouter(this.authService);

  late final router = GoRouter(
    initialLocation: '/signin',
    debugLogDiagnostics: true,
    redirect: _handleRedirect,
    routes: [
      // Public routes
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/know-about-us',
        builder: (context, state) => About(),
      ),
      GoRoute(
        path: '/hidden/changeMailTiming',
        builder: (context, state) => const MailTiming(),
      ),
      GoRoute(
        path: '/wardDetails',
        builder: (context, state) => const WardDetails(),
      ),
      GoRoute(
        path: '/superadmin',
        builder: (context, state) => const SuperAdmin(),
      ),

      // Auth routes
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: '/forgotpassword',
        builder: (context, state) => const ForgotPassword(),
      ),

      // Protected student routes
      GoRoute(
        path: '/studentdashboard',
        builder: (context, state) => const DashBoard(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/leaverequest',
        builder: (context, state) => const LeaveRequestForm(),
      ),
      GoRoute(
        path: '/bonafiedrequest',
        builder: (context, state) => const BonafiedRequestForm(),
      ),

      // HOD routes
      GoRoute(
        path: '/hoddash',
        builder: (context, state) => const HodDashboard(),
      ),

      // Staff routes
      GoRoute(
        path: '/staffdashboard',
        builder: (context, state) => const StaffDashBoard(),
      ),

      // 404 route - must be last
      GoRoute(
        path: '/:path(.*)',
        builder: (context, state) => const PageNotFound(),
      ),
    ],
  );

  String? _handleRedirect(BuildContext context, GoRouterState state) {
    final currentPath = state.uri.path;
    final isLoggedIn = authService.isAuthenticated;
    final isHod = authService.isHod;
    final isStaff = authService.isStaff;
    final isStudent = authService.isStudent;
    final isGoingToLogin =
        currentPath == '/signin' || currentPath == '/forgotpassword';

    // List of pages that don't need authentication
    final publicPages = [
      '/',
      '/know-about-us',
      '/wardDetails',
      '/hidden/changeMailTiming',
      '/superadmin',
      '/signin',
      '/forgotpassword'
    ];

    // List of dashboard pages (for Navbar/Footer logic)
    final dashboardPages = [
      '/profile',
      '/staffdashboard',
      '/hoddash',
      '/superadmin'
    ];

    // If user is not logged in and trying to access protected route
    if (!isLoggedIn && !publicPages.contains(currentPath)) {
      return '/signin';
    }

    // If user is logged in and trying to access login page
    if (isLoggedIn && isGoingToLogin) {
      if (isStudent) return '/studentdashboard';
      if (isHod) return '/hoddash';
      if (isStaff) return '/staffdashboard';
    }

    // Role-based access control
    if (isLoggedIn) {
      // HOD-only routes
      if (currentPath == '/hoddash' && !isHod) {
        return '/';
      }

      // Staff-only routes
      if (currentPath == '/staffdashboard' && !isStaff) {
        return '/';
      }

      // Student-only routes
      final studentRoutes = [
        '/studentdashboard',
        '/leaverequest',
        '/bonafiedrequest'
      ];
      if (studentRoutes.contains(currentPath) && !isStudent) {
        return '/';
      }
    }

    // No redirection needed
    return null;
  }

  // Helper method to determine if navbar should be shown
  bool shouldShowNavbar(String currentPath) {
    final dashboardPages = [
      '/profile',
      '/staffdashboard',
      '/hoddash',
      '/superadmin'
    ];
    return !dashboardPages.contains(currentPath);
  }

  // Helper method to determine if footer should be shown
  bool shouldShowFooter(String currentPath) {
    final footerPages = [
      '/',
      '/studentsignup',
      '/staffsignup',
      '/signin',
      '/wardDetails'
    ];
    return footerPages.contains(currentPath) || currentPath.contains('/*');
  }
}
