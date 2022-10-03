class PopularPersonImage {
  String? filePath;
  int? id;

  PopularPersonImage({
    this.id,
    this.filePath,
  });

  PopularPersonImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filePath = json['file_path'];
  }
}
