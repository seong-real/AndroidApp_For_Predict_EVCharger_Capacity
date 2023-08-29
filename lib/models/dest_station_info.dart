class DestStationInfo {
  final String address, name;
  final double occupancy_20,
      occupancy_40,
      occupancy_60,
      occupancy_120,
      distance;
  final int sid, fast;

  DestStationInfo.fromJson(Map<dynamic, dynamic> json)
      : address = json['station']['address'] ?? '오류',
        name = json['station']['name'] ?? '오류',
        sid = json['station']['sid'] ?? 0,
        fast = json['station']['fast'],
        occupancy_20 = json['occupancy20_0'] ?? 0.0,
        occupancy_40 = json['occupancy40_0'] ?? 0.0,
        occupancy_60 = json['occupancy60_0'] ?? 0.0,
        occupancy_120 = json['occupancy120_0'] ?? 0.0,
        distance = json['distance'] ?? 0.0;

  DestStationInfo({
    required this.fast,
    required this.distance,
    required this.address,
    required this.name,
    required this.sid,
    required this.occupancy_20,
    required this.occupancy_40,
    required this.occupancy_60,
    required this.occupancy_120,
  });
}
