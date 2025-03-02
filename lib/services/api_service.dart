import 'package:vcet_connect/models/staff_user_model.dart';
import "package:vcet_connect/models/user_model.dart";
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://vcet-connect.onrender.com/api/'));

  Future<UserModel?> studentSignin(String identifier, String password) async {
    try {
      Response response = await dio.post('auth/studentsignin',
          data: {"identifier": identifier, "password": password});

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        print("Student Signin Error: ${response.data['message']}");
        return null;
      }
    } catch (e) {
      print('Student-Sign-in Error: $e');
      return null;
    }
  }

  Future<StaffModel?> staffSignin(String identifier, String password) async {
    try {
      Response response = await dio.post('auth/staffsignin',
          data: {"identifier": identifier, "password": password});
      if (response.statusCode == 200) {
        return StaffModel.fromJson(response.data);
      } else {
        print("Staff Signin Error: ${response.data['message']}");
        return null;
      }
    } catch (e) {
      print('Staff-Sign-in: $e');
      return null;
    }
  }
}
