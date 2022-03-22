class Precint {
  final String id;
  final String code;
  final String region;
  final String municipality;
  final String province;
  final String barangay;
  final String no;
  final String pollplace;
  final String regVoters;

  // Precint(
  //     {required this.id,
  //     required this.code,
  //     required this.region,
  //     required this.municipality,
  //     required this.province,
  //     required this.barangay,
  //     required this.no,
  //     required this.pollplace,
  //     required this.regVoters});

  Precint.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.code = json['precint_code'],
        this.region = json['region'],
        this.municipality = json['municipality'],
        this.province = json['province'],
        this.barangay = json['barangay'],
        this.no = json['precint_no'],
        this.pollplace = json['pollplace'],
        this.regVoters = json['regvoter'];

  Map toJson() {
    return {
      'id': id,
      'code': code,
      'region': region,
      'municipality': municipality,
      'province': province,
      'barangay': barangay,
      'no': no,
      'pollplace': pollplace,
      'regvoter': regVoters
    };
  }
}
