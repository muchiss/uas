import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:wicat/model/model_cat.dart';

class CatService {
  static Future<List<Cat>> fetchCat() async {
    Dio dio = Dio();

    var response = await dio.get('http://localhost:3000/cat');

    // print(response.data);
    List<Cat> cat =
        (response.data as List).map((v) => Cat.fromJson(v)).toList();
    print(cat[0].toString());
    return cat;
  }
}
