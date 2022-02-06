class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });
  late final dynamic lon;
  late final dynamic lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lon'] = lon;
    _data['lat'] = lat;
    return _data;
  }
}
