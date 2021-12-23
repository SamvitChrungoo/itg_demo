class LocationResponse {
  String? placeName;
  String? placeId;

  LocationResponse({this.placeName, this.placeId});

  LocationResponse.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName'];
    placeId = json['placeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['placeName'] = placeName;
    data['placeId'] = placeId;
    return data;
  }
}
