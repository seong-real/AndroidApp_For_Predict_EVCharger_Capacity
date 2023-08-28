import 'package:tmap_raster_flutter_sample/models/dest_station_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:developer';

class DestApiService {
  static const double latitude = 37.566368;
  static const double longitude = 126.985089;
  static var time = DateTime.now();
  String formatDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
  static const String baseUrl = "https://hwangpeng.kro.kr";
  static const String station = "station?lat=$latitude&lng=$longitude";

  static Future<List<DestStationInfo>> getStationInfo() async {
    List<DestStationInfo> stationinfo = [];
    final url = Uri.parse('$baseUrl/$station');
    final response = await http.get(url);
    log('Response status code: ${response.statusCode}', name: 'ApiService');
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(decodedBody);
      log('result: $jsonData');

      for (var datas in jsonData['data']) {
        final instance = DestStationInfo.fromJson(datas);
        stationinfo.add(instance);
      }
      log('Fetched station info: $stationinfo', name: 'ApiService');
      return stationinfo;
    }

    throw Error();
  }
}
