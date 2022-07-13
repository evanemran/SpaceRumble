class IssNowResponse {
  String? message;
  IssPosition? issPosition;
  int? timestamp;

  IssNowResponse({this.message, this.issPosition, this.timestamp});

  IssNowResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    issPosition = json['iss_position'] != null
        ? new IssPosition.fromJson(json['iss_position'])
        : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.issPosition != null) {
      data['iss_position'] = this.issPosition!.toJson();
    }
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class IssPosition {
  String? longitude;
  String? latitude;

  IssPosition({this.longitude, this.latitude});

  IssPosition.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
