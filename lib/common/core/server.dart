///Name: Md. Abdur Rouf
///Email: official.rouf69nb@gmail.com
///Created at: Dec 14, 2021

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/io_client.dart' as _io;
import 'app.dart';


class Server{
  static final Server _s = Server._();
  late _io.IOClient _client;
  static Server get instance=> _s;
  Server._(){
    HttpClient _httpClient = HttpClient();
    _httpClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    _client = _io.IOClient(_httpClient);
  }


  static String get host => "http://cv-api.bacbontutors.com";

  Future<ServerResponse> postRequest({required String url, required Map postData,}) async {
    try {
      var body = json.encode(postData);
      var response = await _client.post(
        Uri.parse("$host/api/$url"),
        headers: {"Accept": "application/json", "Content-Type": "application/json", "Authorization": "${App.currentSession.tokenType} ${App.currentSession.accessToken}"},
        body: body,
      );
      debugPrint("REQUEST => ${response.request.toString()}");
      debugPrint("REQUEST DATA => $body");
      debugPrint("RESPONSE DATA => ${response.body.toString()}");

      var jsonData = jsonDecode(response.body);
      return ServerResponse.fromJson(jsonData);
    }
    on SocketException catch(_){
      return ServerResponse(success: false, data: _, message:  "Request failed!. Check internet connection.");
    }
    on Exception catch(_)
    {
      return ServerResponse(success: false, data: _, message: "Request failed! Unknown error occurred.");
    }
  }

  Future<dynamic> getRequest({required String url,String? token}) async {
    try {
      var response = await _client.get(
          Uri.parse("$host/api/$url"),
          headers: {"Accept": "application/json", "Content-Type":"application/json", "Authorization": "${App.currentSession.tokenType} ${App.currentSession.accessToken}"}
      );

      debugPrint("REQUEST => ${response.request.toString()}\nRESPONSE DATA => ${response.body.toString()}");

      var jsonData = jsonDecode(response.body);
      return ServerResponse.fromJson(jsonData);
    }
    on SocketException catch(_){
      return ServerResponse(success: false, data: _, message: "Request failed!. Check internet connection.");
    }
    on Exception catch(_)
    {
      return ServerResponse(success: false, data: _, message: "Request failed! Unknown error occurred.");
    }
  }
}

class ServerResponse {
  dynamic data;
  late String message;
  late bool success;

  ServerResponse({this.data, required this.message, required this.success});

  ServerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message']??"";
    success = json['success']??false;
    data = json['data'];
  }
}