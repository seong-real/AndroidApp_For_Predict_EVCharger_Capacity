class StationInfo {
  final String title, thumb, id;

  StationInfo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
