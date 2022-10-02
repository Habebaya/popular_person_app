import 'dart:io';

class APIConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';


  static const headerWithoutToken = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json'
  };



}
