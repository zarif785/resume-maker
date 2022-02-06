import 'dart:convert';

import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/UserSession.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App{

  static UserSession _session = UserSession.empty();
  static UserSession get currentSession => _session;




  static Future<UserSession> getCurrentSession()  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('session data');
    if(data!=null && data.isNotEmpty){
      _session = UserSession.fromJson(jsonDecode(data));
    }

    return Future.value(_session);
  }

  static Future<UserSession> setCurrentSession(UserSession session) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('session data', jsonEncode(session.toJson()));
    return getCurrentSession();
  }

}