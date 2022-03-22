class MyData {
  late List<Candidates> result;

  MyData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      List<Candidates> result = []..length;

      json['data'].forEach((v) {
        result.add(new Candidates.fromJson(v));
      });
    }
  }
}

class Candidates {
  late String name;
  late String position;
  late String gender;
  late String level;
  late String party;

  Candidates.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    position = json['position'];
    gender = json['gender'];
    level = json['level'];
    party = json['party'];
  }
}
