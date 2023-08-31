import 'package:tmap_raster_flutter_sample/models/station_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class ApiService {
  static const String baseUrl = "https://hwangpeng.kro.kr";
  static const String stationEndpoint = "station";

  static Future<List<StationInfo>> getStationInfoFromCSV() async {
    String filePath =
        '/data/data/kr.co.sl.tmap_raster_flutter_sample/files/loc.csv';

    File file = File(filePath);
    String contents = await file.readAsString();
    final List<String> lines = contents.split('\n');
    if (lines.isNotEmpty) {
      final List<String> coordinates = lines[0].split(',');
      if (coordinates.length == 2) {
        final latitude = double.tryParse(coordinates[1]);
        final longitude = double.tryParse(coordinates[0]);
        if (latitude != null && longitude != null) {
          return _getStationInfo(latitude, longitude);
        }
      }
    }
    throw Error();
  }

  static Future<List<StationInfo>> _getStationInfo(
      double latitude, double longitude) async {
    List<StationInfo> stationInfoList = [];
    final url =
        Uri.parse('$baseUrl/$stationEndpoint?lat=$latitude&lng=$longitude');
    final response = await http.get(url);
    log('Response status code: ${response.statusCode}', name: 'ApiService');
    if (response.statusCode == 200) {
      final decodedBody = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(decodedBody);
      log('result: $jsonData');

      for (var data in jsonData['data']) {
        final instance = StationInfo.fromJson(data);
        log('$instance');
        stationInfoList.add(instance);
      }
      log('Fetched station info: $stationInfoList', name: 'ApiService');
      return stationInfoList;
    }
    throw Error();
  }
}
