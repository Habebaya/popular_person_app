import 'package:http/http.dart';
import 'package:task/constant/api.dart';
import 'package:task/service/network_service.dart';

class ItemService {
  final NetworkService _networkService = NetworkService();

  Future<Response> getAllPopularPerson() async {
    const url = APIConstants.baseUrl + APIConstants.personPERFIX +
        APIConstants.popularPERFIX + '?api_key=${APIConstants.apiKey}';

    late Response response;
    print(url);
    try {
      response = await _networkService.get(url,
          headers: APIConstants.headerWithoutToken);
    } catch (e) {
      print(e);
    }

    return response;
  }
}