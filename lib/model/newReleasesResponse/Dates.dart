/// maximum : "2023-11-22"
/// minimum : "2023-11-01"

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;
  Dates copyWith({
    String? maximum,
    String? minimum,
  }) =>
      Dates(
        maximum: maximum ?? this.maximum,
        minimum: minimum ?? this.minimum,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}
