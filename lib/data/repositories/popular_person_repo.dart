import 'dart:developer';

import 'package:http/http.dart';
import 'package:task/constant/api.dart';
import 'package:task/service/network_service.dart';

class PopularPersonRepository {
  final NetworkService _networkService = NetworkService();

  Future<Response> getAllPopularPerson(int page) async {
    final url =
        '${APIConstants.baseUrl}${APIConstants.personPERFIX}${APIConstants.popularPERFIX}?api_key=${APIConstants.apiKey}&page=${page}';

    late Response response;
    print(url);
    try {
      response = await _networkService.get(url,
          headers: APIConstants.headerWithoutToken);
    } catch (e) {
      log(e.toString());
    }

    return response;
  }

  Future<Response> getPopularPerson(int id) async {
    final url =
        '${APIConstants.baseUrl}${APIConstants.personPERFIX}/$id?api_key=${APIConstants.apiKey}';

    late Response response;
    try {
      response = await _networkService.get(url,
          headers: APIConstants.headerWithoutToken);
    } catch (e) {
      log(e.toString());
    }

    return response;
  }

  Future<Response> getPopularPersonImage(int id) async {
    final url =
        '${APIConstants.baseUrl}${APIConstants.personPERFIX}/$id${APIConstants.imagesERFIX}?api_key=${APIConstants.apiKey}';

    late Response response;
    try {
      response = await _networkService.get(url,
          headers: APIConstants.headerWithoutToken);
    } catch (e) {
      log(e.toString());
    }

    return response;
  }
}
