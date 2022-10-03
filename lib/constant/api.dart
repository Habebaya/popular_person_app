import 'dart:io';

class APIConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'f2b459686afc63ed3a2b26e24d748c29';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const personPERFIX = '/person';
  static const popularPERFIX = '/popular';
  static const imagesERFIX = '/images';



  static const headerWithoutToken = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json'
  };
}
