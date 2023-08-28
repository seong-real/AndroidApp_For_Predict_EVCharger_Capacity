import 'package:tmap_raster_flutter_sample/models/detail_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:developer';

class TimeApiService {
  static const String baseUrl = "https://hwangpeng.kro.kr";

  static Future<DetailInfo> getStationInfo(int sid) async {
    var time = DateTime.now();
    String formatDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(time);
    log(formatDate);
    final timeurl = Uri.parse('$baseUrl/station/$sid?time=$formatDate');
    log('$baseUrl/station/$sid?time=$formatDate');

    final response = await http.get(timeurl);
    log('Response status code: ${response.statusCode}', name: 'ApiService');
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(decodedBody);
      log('result: $jsonData');

      final stationinfo = DetailInfo.fromJson(jsonData['data']);

      log('Fetched station info: $stationinfo', name: 'ApiService');
      return stationinfo;
    }

    throw Error();
  }
}
