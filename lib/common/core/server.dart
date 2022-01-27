import 'dart:io';

class Server{
  static final Server _s= Server._();
  static Server get instance => _s;
  Server._(){
    HttpClient _httpClient = HttpClient();
  }

  static String get host=> "http://cv-api.bacbontutors.com";



}


class ServerResponse {
  dynamic data;
  late String message;
  late int status;

  ServerResponse({this.data, required this.message, required this.status});

  ServerResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message']??"";
    status = json['Status']??0;
    data = json['Data'];
  }
}