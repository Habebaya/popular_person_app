class PopularPerson {
  String? name, profilePath, knownForDepartment, biography, birthday,placeOfBirth;
  int? id, gender;

  PopularPerson(
      {this.id,
      this.name,
      this.profilePath,
      this.knownForDepartment,
      this.biography,
      this.gender,
      this.birthday,
      this.placeOfBirth});

  PopularPerson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    profilePath = json['profile_path'] ?? "";
    knownForDepartment = json['known_for_department'];
    biography = json['biography'];
    gender = json['gender'];
    birthday = json['birthday'];
    placeOfBirth = json['place_of_birth'];
  }
}
