class PopularPerson {
  String?  name, profilePath,knownForDepartment;
  dynamic?id;

  PopularPerson({this.id, this.name, this.profilePath, this.knownForDepartment});


  PopularPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
    knownForDepartment = json ['known_for_department'];

  }

}
