class AuthService {
  bool _isAuthenticated = false;
  String? _userRole;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  bool get isHod => _isAuthenticated && _userRole == 'hod';
  bool get isStaff => _isAuthenticated && _userRole == 'staff';
  bool get isStudent => _isAuthenticated && _userRole == 'student';
  String? get userId => _userId;

  Future<bool> signIn(String email, String password) async {
    if (email.contains('hod')) {
      _userRole = 'hod';
      _isAuthenticated = true;
    } else if (email.contains('staff')) {
      _userRole = 'staff';
      _isAuthenticated = true;
    } else if (email.contains('student')) {
      _userRole = 'student';
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
      _userRole = null;
    }

    if (_isAuthenticated) {
      _userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
    }

    return _isAuthenticated;
  }

  Future<void> signOut() async {
    _isAuthenticated = false;
    _userRole = null;
    _userId = null;
  }

  Future<bool> resetPassword(String email) async {
    return true;
  }
}
