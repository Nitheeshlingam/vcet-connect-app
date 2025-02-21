/// Defines all route names used in the application
class RouteNames {
  // Public routes
  static const String home = '/';
  static const String about = '/know-about-us';
  static const String mailTiming = '/hidden/changeMailTiming';
  static const String wardDetails = '/wardDetails';
  static const String superAdmin = '/superadmin';

  // Auth routes
  static const String signIn = '/signin';
  static const String forgotPassword = '/forgotpassword';

  // Student routes
  static const String studentDashboard = '/studentdashboard';
  static const String profile = '/profile';
  static const String leaveRequest = '/leaverequest';
  static const String bonafiedRequest = '/bonafiedrequest';

  // HOD routes
  static const String hodDashboard = '/hoddash';

  // Staff routes
  static const String staffDashboard = '/staffdashboard';

  // Catch-all route
  static const String notFound = '/:path(.*)';
}
