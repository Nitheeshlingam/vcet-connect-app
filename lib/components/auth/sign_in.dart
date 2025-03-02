import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:vcet_connect/components/general/footer.dart';
import 'package:vcet_connect/components/general/navbar.dart';
import 'package:vcet_connect/components/general/sidebar.dart';
import 'package:vcet_connect/models/staff_user_model.dart';
import 'package:vcet_connect/models/user_model.dart';
import 'package:vcet_connect/services/api_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final ApiService apiService = ApiService();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isStudent = false;
  bool isLoading = false;
  var sessionManager = SessionManager();

  void setLoader() {
    setState(() {
      isLoading = true;
    });
  }

  void removeLoader() {
    setState(() {
      isLoading = false;
    });
  }

  void login() async {
    setLoader();

    String identifier = rollNoController.text.toString();
    String password = passwordController.text.toString();

    try {
      if (isStudent) {
        UserModel? student =
            await apiService.studentSignin(identifier, password);
        if (student != null) {
          String? studentModelString = jsonEncode(student.toJson());
          await sessionManager.set("student_data", studentModelString);
          Navigator.pop(context);
          Navigator.pushNamed(context, '/studentdashboard');
        } else {
          print('Value varala da');
        }
      } else {
        StaffModel? staff = await apiService.staffSignin(identifier, password);
        if (staff != null) {
          String? staffModelString = jsonEncode(staff.toJson());
          await sessionManager.set("staff_data", staffModelString);
          Navigator.pop(context);
          Navigator.pushNamed(context, '/staffdashboard');
        } else {
          print('Value varala da');
        }
      }
    } on DioException catch (e) {
      print('Error in Login: $e');
      return null;
    } finally {
      removeLoader();
    }
  }

  @override
  void dispose() {
    rollNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: SidebarDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Please select your role and enter your credentials',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isStudent = true;
                                      });
                                    },
                                    child: inputField(
                                        'assets/images/student_icon.png',
                                        'Student',
                                        isStudent
                                            ? Colors.blue
                                            : Colors.black)),
                                SizedBox(
                                  width: 40.0,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isStudent = false;
                                      });
                                    },
                                    child: inputField(
                                        'assets/images/staff_icon.png',
                                        'Staff',
                                        !isStudent
                                            ? Colors.blue
                                            : Colors.black))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: [
                                  inputText(
                                      isStudent
                                          ? 'Enter Roll number'
                                          : 'Enter Staff Id',
                                      Icons.person_outline_sharp,
                                      rollNoController,
                                      false),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  inputText(
                                      'Enter Password',
                                      Icons.lock_outline,
                                      passwordController,
                                      true),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : ElevatedButton(
                                          onPressed: login,
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0))),
                                          child: Center(
                                            child: Text('Sign In'),
                                          )),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  TextField inputText(String label, IconData icon,
      TextEditingController controller, bool isPassword) {
    return TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.black, width: 2.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.black, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.blue, width: 2.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
        ));
  }

  Widget inputField(String imagePath, String role, Color color) {
    return Container(
        width: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: color, width: 2.0)),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 25.0,
                  width: 25.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  role,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void showCustomSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      duration: Duration(seconds: 2),
    ));
  }
}
