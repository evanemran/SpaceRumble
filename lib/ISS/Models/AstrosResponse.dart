class AstrosResponse {
  int? number;
  List<People>? people;
  String? message;

  AstrosResponse({this.number, this.people, this.message});

  AstrosResponse.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(new People.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.people != null) {
      data['people'] = this.people!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class People {
  String? name;
  String? craft;

  People({this.name, this.craft});

  People.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    craft = json['craft'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['craft'] = this.craft;
    return data;
  }
}
