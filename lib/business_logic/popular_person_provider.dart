import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:task/data/models/popular_person_model.dart';
import 'package:task/data/repositories/popular_person_repo.dart';

import '../utility/validator.dart';

class PopularPersonProvider with ChangeNotifier {
  final PopularPersonRepository _popularPersonRepository =
      PopularPersonRepository();
  List<PopularPerson> popularPersonList = [];

  Future<void> getAllPopularPerson() async {
    try {
      final popularPersonResponse =
          await _popularPersonRepository.getAllPopularPerson();
      if (Validators.responseIsValid(popularPersonResponse)) {
        print("habrba");


        final decoded = jsonDecode(popularPersonResponse.body);


        List popularPerson = decoded['results'];

        for (var element in popularPerson) {

          popularPersonList.add(PopularPerson.fromJson(element));
          print(popularPersonList.length);
        }
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  void classifyPopularPerson(Map<String, dynamic> data) {
    final List allPopularPersonMap = data['results'];
    popularPersonList = allPopularPersonMap
        .map((popularPerson) => PopularPerson.fromJson(popularPerson))
        .toList();
  }
}
