class PopularPerson {
  String? id, name, profilePath,knownForDepartment;

  PopularPerson({this.id, this.name, this.profilePath, this.knownForDepartment});


  PopularPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profilePath'];
    knownForDepartment = json ['known_for_department'];

  }

}
