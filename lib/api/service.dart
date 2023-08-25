import 'package:http/http.dart' as http;
import 'package:tmap_raster_flutter_sample/api/station.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static const String url = 'http://hwangpeng.kro.kr/';

  static Future<Station> getInfo() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final station = stationFromJson(response.body);
        return station;
      } else {
        Fluttertoast;
      }
    } catch (e) {}
  }
}
