class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
  late final dynamic type;
  late final dynamic id;
  late final dynamic message;
  late final String country;
  late final dynamic sunrise;
  late final dynamic sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    message = json['message'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['id'] = id;
    _data['message'] = message;
    _data['country'] = country;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}
