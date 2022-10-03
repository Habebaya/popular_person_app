import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:task/data/models/popular_person_model.dart';
import 'package:task/data/repositories/popular_person_repo.dart';

class PopularPersonProvider with ChangeNotifier {
  final PopularPersonRepository _popularPersonRepository = PopularPersonRepository();
  List<PopularPerson> popularPersonList = [];

  Future<void> getAllPopularPerson() async {
    Response response;
    try {
      response = await _popularPersonRepository.getAllPopularPerson();
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}