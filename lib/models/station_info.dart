class StationInfo {
  final String address, name;
  final int occupancy_20, occupancy_40, occupancy_60, occupancy_120;
  final double distance;
  final int sid;

  StationInfo.fromJson(Map<dynamic, dynamic> json)
      : address = json['station']['address'],
        name = json['station']['name'],
        sid = json['station']['sid'],
        occupancy_20 = json['occupancy20'] ?? 0.0,
        occupancy_40 = json['occupancy40'] ?? 0.0,
        occupancy_60 = json['occupancy60'] ?? 0.0,
        occupancy_120 = json['occupancy120'] ?? 0.0,
        distance = json['distance'] ?? 0.0;

  StationInfo({
    required this.address,
    required this.name,
    required this.sid,
    required this.occupancy_20,
    required this.occupancy_40,
    required this.occupancy_60,
    required this.occupancy_120,
    required this.distance,
  });
}
