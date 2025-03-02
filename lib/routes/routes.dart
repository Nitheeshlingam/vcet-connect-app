import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vcet_connect/routes/route_names.dart';

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
    initialLocation: RouteNames.home,
    debugLogDiagnostics: true,
    redirect: _handleRedirect,
    routes: [
      // Public routes
      GoRoute(
        path: RouteNames.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RouteNames.about,
        name: 'about',
        builder: (context, state) => About(),
      ),
      GoRoute(
        path: RouteNames.mailTiming,
        name: 'mailTiming',
        builder: (context, state) => const MailTiming(),
      ),
      GoRoute(
        path: RouteNames.wardDetails,
        name: 'wardDetails',
        builder: (context, state) => const WardDetails(),
      ),
      GoRoute(
        path: RouteNames.superAdmin,
        name: 'superAdmin',
        builder: (context, state) => const SuperAdmin(),
      ),

      // Auth routes
      GoRoute(
        path: RouteNames.signIn,
        name: 'signIn',
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPassword(),
      ),

      // Protected student routes
      GoRoute(
        path: RouteNames.studentDashboard,
        name: 'studentDashboard',
        builder: (context, state) => const DashBoard(),
      ),
      GoRoute(
        path: RouteNames.profile,
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: RouteNames.leaveRequest,
        name: 'leaveRequest',
        builder: (context, state) => const LeaveRequestForm(),
      ),
      GoRoute(
        path: RouteNames.bonafiedRequest,
        name: 'bonafiedRequest',
        builder: (context, state) => const BonafiedRequestForm(),
      ),

      // HOD routes
      GoRoute(
        path: RouteNames.hodDashboard,
        name: 'hodDashboard',
        builder: (context, state) => const HodDashboard(),
      ),

      // Staff routes
      GoRoute(
        path: RouteNames.staffDashboard,
        name: 'staffDashboard',
        builder: (context, state) => const StaffDashBoard(),
      ),

      // 404 route - must be last
      GoRoute(
        path: RouteNames.notFound,
        name: 'notFound',
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
    final isGoingToLogin = currentPath == RouteNames.signIn ||
        currentPath == RouteNames.forgotPassword;

    // List of pages that don't need authentication
    final publicPages = [
      RouteNames.home,
      RouteNames.about,
      RouteNames.wardDetails,
      RouteNames.mailTiming,
      RouteNames.superAdmin,
      RouteNames.signIn,
      RouteNames.forgotPassword,
    ];

    // List of dashboard pages (for Navbar/Footer logic)
    final dashboardPages = [
      RouteNames.profile,
      RouteNames.staffDashboard,
      RouteNames.hodDashboard,
      RouteNames.superAdmin,
    ];

    // If user is not logged in and trying to access protected route
    if (!isLoggedIn && !publicPages.contains(currentPath)) {
      return RouteNames.signIn;
    }

    // If user is logged in and trying to access login page
    if (isLoggedIn && isGoingToLogin) {
      if (isStudent) return RouteNames.studentDashboard;
      if (isHod) return RouteNames.hodDashboard;
      if (isStaff) return RouteNames.staffDashboard;
    }

    // Role-based access control
    if (isLoggedIn) {
      // HOD-only routes
      if (currentPath == RouteNames.hodDashboard && !isHod) {
        return RouteNames.home;
      }

      // Staff-only routes
      if (currentPath == RouteNames.staffDashboard && !isStaff) {
        return RouteNames.home;
      }

      // Student-only routes
      final studentRoutes = [
        RouteNames.studentDashboard,
        RouteNames.leaveRequest,
        RouteNames.bonafiedRequest,
      ];
      if (studentRoutes.contains(currentPath) && !isStudent) {
        return RouteNames.home;
      }
    }

    // No redirection needed
    return null;
  }

  // Helper method to determine if navbar should be shown
  bool shouldShowNavbar(String currentPath) {
    final dashboardPages = [
      RouteNames.profile,
      RouteNames.staffDashboard,
      RouteNames.hodDashboard,
      RouteNames.superAdmin,
    ];
    return !dashboardPages.contains(currentPath);
  }

  // Helper method to determine if footer should be shown
  bool shouldShowFooter(String currentPath) {
    final footerPages = [
      RouteNames.home,
      '/studentsignup',
      '/staffsignup',
      RouteNames.signIn,
      RouteNames.wardDetails,
    ];
    return footerPages.contains(currentPath) || currentPath.contains('/*');
  }
}
