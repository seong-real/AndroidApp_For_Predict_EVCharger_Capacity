class DestStationInfo {
  final String address, name;
  final double occupancy_20, occupancy_40, occupancy_60, occupancy_120;
  final int sid;

  DestStationInfo.fromJson(Map<dynamic, dynamic> json)
      : address = json['address'],
        name = json['name'],
        sid = json['sid'],
        occupancy_20 = json['occupancy20'] ?? 0.0,
        occupancy_40 = json['occupancy40'] ?? 0.0,
        occupancy_60 = json['occupancy60'] ?? 0.0,
        occupancy_120 = json['occupancy120'] ?? 0.0;

  DestStationInfo({
    required this.address,
    required this.name,
    required this.sid,
    required this.occupancy_20,
    required this.occupancy_40,
    required this.occupancy_60,
    required this.occupancy_120,
  });
}
