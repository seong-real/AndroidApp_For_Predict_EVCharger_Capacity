import 'package:tmap_raster_flutter_sample/models/station_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class ApiService {
  static const double latitude = 37.4920;
  static const double longitude = 126.9260;
  static var time = DateTime.now();
  String formatDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
  static const String baseUrl = "http://hwangpeng.kro.kr/";
  static const String station =
      "station?latitude=$latitude&longitude=$longitude";

  static Future<List<StationInfo>> getStationInfo() async {
    List<StationInfo> stationinfo = [];
    final url = Uri.parse('$baseUrl/$station');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final infos = jsonDecode(response.body);
      for (var infos in infos) {
        final instance = StationInfo.fromJson(infos);
        stationinfo.add(instance);
      }
      return stationinfo;
    }
    throw Error();
  }
}
