import 'dart:convert';
import 'dart:developer';
import 'package:checkoutin/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class RegisterRepository {
  final Dio _dio = Dio();

  Future adduser({
    required String nama,
    required String nohp,
    required String alamat,
    required String email,
    required String password,
  }) async {
    try {
      FormData formdata = FormData.fromMap({
        'nama' : nama,
        'nohp' : nohp,
        'alamat' : alamat,
        'email' : email,
        'password': password
      });
    Response response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/register.php',
    data: formdata,
  );

  if (response.statusCode == 200){
    return response.data;
  } else {
    throw Exception('Failed to Register');
  }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}