import 'dart:convert';
import 'dart:developer';
import 'package:checkoutin/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginRepository extends Repository {
  Future logout() async {
  final Dio _dio = Dio();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String sessionToken = prefs.getString('session') ?? "";
  Map fdataMap = {'session_token' : sessionToken};
  FormData fdata = FormData();
  fdata.fields.addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
  final response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/logout.php',
    data: fdata,
  );
  prefs.remove('session_token');
}
  Future login({required String username, required String password}) async{
    final Dio _dio = Dio();
    Map fdataMap = {'user' : username, 'pass' : password};
  FormData fdata = FormData();
  fdata.fields.addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
  final response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/login.php',
    data: fdata,
  );
  log("res $response");
  Map repoResponse = {"status": false, "data": Null};
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.data);
    if (data['status'] == 'success') {
      repoResponse['status'] = true;
      repoResponse['data'] = data;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('session', data['session_token']);

    }else{
      repoResponse['data'] = data;
    }
  }
  return repoResponse;
  }


  Future adduser({
    required String nama,
    required String nohp,
    required String alamat,
    required String email,
    required String password,
  }) async {
    try {
       final Dio _dio = Dio();
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
  
  Future editUser({
  String nama ="",
    String nohp = "",
    String alamat = "",
  }) async {
    try {
       final Dio _dio = Dio();
       final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String sessionToken = prefs.getString('session') ?? "";
      FormData formdata = FormData.fromMap({
        'nama' : nama,
        'nohp' : nohp,
        'alamat' : alamat,
        'token' : sessionToken
      });
    Response response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/editprofil.php',
    data: formdata,
  );

  if (response.statusCode == 200){
    return response.data;
  } else {
    throw Exception('Failed to Change');
  }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
  Future getInfoUser() async {
  final Dio _dio = Dio();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String sessionToken = prefs.getString('session') ?? "";
  Map fdataMap = {'session_token' : sessionToken};
  FormData fdata = FormData();
 
  fdata.fields.addAll(fdataMap.entries.map((e) => MapEntry(e.key, e.value)));
  final response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/getuser.php',
    data: fdata,
  );
    Map<String, dynamic> responseData =
    Map<String, dynamic>.from(response.data);
    log("Res $responseData");
    return responseData;
  }
  
}
