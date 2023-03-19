import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  //final _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';
  final _backendBaseUrl = 'http://54.82.102.109:5665/api/v1';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  RestClientException(this.message, {this.code});

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
