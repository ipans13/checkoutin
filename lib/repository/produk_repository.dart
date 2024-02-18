import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
class ProdukRepository {
  final Dio _dio = Dio();

Future addProduk(
  {required String nmbarang,
  required String harga,
  required String stok,
  required String rating,
  required String deskripsi,
  required File image
  }) async {
try {
  FormData formData = FormData.fromMap({
    'namabarang' : nmbarang,
    'harga' : harga,
    'tanggal' : stok,
    'rating' : rating,
    'deskripsi' : deskripsi,
    'url_image':
    await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
  });
  Response response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/news_catalog/addnews.php', data: formData,
  );

  if (response.statusCode == 200) {
    return response.data;
  } else{
    throw Exception('Failed to add news');
  }
} catch (e) {
  throw Exception('Error: $e');
  
}
  }

Future getProdukList(keyword) async {
  try {
    log("Getting Produk");
    var response = await _dio.get(
      'https://checkoutinsttb.000webhostapp.com/api/listproduk.php',
      queryParameters: {'key': keyword},
    );
      Map<String, dynamic> responseData =
    Map<String, dynamic>.from(response.data);
    log("list ${responseData['msg']}");

    if (response.statusCode == 200) {
      List produkList = responseData['data'];
      return produkList;

    } else{
      log("Error: ${response.statusCode}");
      return []; 
    }
  } catch (e) {
    log("Error");
  }
}
Future selectProduk (String idProduk) async {
  log(idProduk);
  FormData formData = FormData.fromMap(
    {'produkId': idProduk,}
    
  );
  final response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/selectproduk.php',
    data: formData,
  );
  Map<String, dynamic> responseData =
    Map<String, dynamic>.from(response.data);
    log("Res $responseData");

    if(responseData['success'] == true){
      responseData['data']['status'] =true;
      return responseData['data'];
    } else{
      return {'status': false, 'msg': responseData['msg']};
    }
}
Future deleteProdukList(String id) async {
  try {
  FormData formData = FormData.fromMap(
    {'idproduk': id,}
  );

  final response = await _dio.post(
'https://checkoutinsttb.000webhostapp.com/api/news_catalog/deletenews.php',
data: formData,
  );
    Map<String, dynamic> responseData =
    Map<String, dynamic>.from(response.data);
    log("Res $responseData");

    if(responseData['success'] == true){
      responseData['data']['status'] =true;
      return responseData['data'];
    } else{
      return {'status': false, 'msg': responseData['msg']};
    }
  } catch (e) {
    
  }
}
Future getWishlist () async {
  final Dio _dio = Dio();
       final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String sessionToken = prefs.getString('session') ?? "";
  FormData formData = FormData.fromMap(
    {'session_token': sessionToken,}
    
  );
  final response = await _dio.post(
    'https://checkoutinsttb.000webhostapp.com/api/getwishlist.php',
    data: formData,
  );
  Map<String, dynamic> responseData =
    Map<String, dynamic>.from(response.data);
    log("Res $responseData");
      List data = responseData['data'];
    log("Ressss");
    if(responseData['success'] == true){
    
       Map<String, dynamic> responseData ={
        'data':data,
        'success':true,
       };
      return responseData;
    } else{
      return {'success': false, 'msg': responseData['msg']};
    }
}

  Future editNews(
  {required String id, 
  required String title, 
  required String content, 
  required String date,
  File? image
  }) async {
    try 
    {Map<String, dynamic> formDataMap ={
    'idnews': id,
    'judul': title,
    'deskripsi': content,
    'tanggal': date
    };
    if (image != null) {

    formDataMap['url_image'] =
    await MultipartFile.fromFile(image.path, filename: 'image.jpg');
    }
    
    FormData formData = FormData.fromMap(formDataMap);
    Response response = await _dio.post(
      'https://checkoutinsttb.000webhostapp.com/api/news_catalog/editnews.php',
      data: formData
      );
      log("RES ${response.data}");
      if (response.statusCode == 200 && response.data['status']){
        return true;
        } 
        else {

        return false;
        } 
        } catch (error) {throw Exception('Error: $error');}
  }
}