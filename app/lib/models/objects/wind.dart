class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });
  late final dynamic speed;
  late final dynamic deg;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    return _data;
  }
}
