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
  late PopularPerson popularPerson;

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

  Future<void> getItem(int id) async {
    Response response;
    try {
      response = await _popularPersonRepository.getPopularPerson(id);
      if (Validators.responseIsValid(response)) {
        final decoded = jsonDecode(response.body);
        print(response.body);

        final onePopularPerson = decoded;
        popularPerson = PopularPerson.fromJson(onePopularPerson);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
