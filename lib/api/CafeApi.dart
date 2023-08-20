import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://localhost:8080/api';

    _dio.options.headers = {
      'x-token': LocalStorage.pref.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      throw ('Error in the GET');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    print(formData.fields);
    try {
      final resp = await _dio.post(path, data: formData);

      return resp.data;
    } catch (e) {
      throw ('Error in the Post $e');
    }
  }
}
