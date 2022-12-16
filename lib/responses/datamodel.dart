class DataModel {
  String? name;
  String? phnNo;
  String? bio;
  String? location;

  DataModel({this.name, this.phnNo, this.bio, this.location});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phnNo = json['phn_no'];
    bio = json['bio'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phn_no'] = this.phnNo;
    data['bio'] = this.bio;
    data['location'] = this.location;
    return data;
  }
}
