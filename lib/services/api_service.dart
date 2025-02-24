import 'package:dio/dio.dart';
import "package:vcet_connect/models/user_model.dart";

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
        print("Error: ${response.data['message']}");
        return null;
      }
    } catch (e) {
      print('Sign-in Error: $e');
      return null;
    }
  }
}
