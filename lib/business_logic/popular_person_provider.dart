import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:task/data/models/popular_person_image_model.dart';
import 'package:task/data/models/popular_person_model.dart';
import 'package:task/data/repositories/popular_person_repo.dart';

import '../utility/validator.dart';

class PopularPersonProvider with ChangeNotifier {
  final PopularPersonRepository _popularPersonRepository =
      PopularPersonRepository();
  List<PopularPerson> popularPersonList = [];
  List<PopularPersonImage> images = [];
  late PopularPerson popularPerson;

  Future<void> getAllPopularPerson() async {
    try {
      final popularPersonResponse =
          await _popularPersonRepository.getAllPopularPerson();
      if (Validators.responseIsValid(popularPersonResponse)) {
        final decoded = jsonDecode(popularPersonResponse.body);

        List popularPerson = decoded['results'];

        for (var element in popularPerson) {
          popularPersonList.add(PopularPerson.fromJson(element));
        }
      }
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> getPopularPerson(int id) async {
    Response response;
    try {
      response = await _popularPersonRepository.getPopularPerson(id);
      if (Validators.responseIsValid(response)) {
        final decoded = jsonDecode(response.body);

        final onePopularPerson = decoded;
        popularPerson = PopularPerson.fromJson(onePopularPerson);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> getPopularPersonImage(int id) async {
    try {
      final popularPersonImageResponse =
          await _popularPersonRepository.getPopularPersonImage(id);
      if (Validators.responseIsValid(popularPersonImageResponse)) {
        final decoded = jsonDecode(popularPersonImageResponse.body);
        print("responde ${decoded}");

        List popularPersonImage = decoded['profiles'];

        for (var element in popularPersonImage) {
          images.add(PopularPersonImage.fromJson(element));
        }
      }
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }
}
