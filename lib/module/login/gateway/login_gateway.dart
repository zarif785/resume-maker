

import 'package:resume_maker/common/core/server.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/UserSession.dart';



mixin LoginGateway{
  static Future<ActionResult<UserSession>> doLogin(String email, String password) async{
    return Server.instance.postRequest(
      url: "login",
      postData: {
        "email":email,
        "password": password
      },
    ).then((value){
      return ActionResult<UserSession>.fromServerResponse(
        response: value,
        generateData: (x)=> UserSession.fromJson(x),
      );
    }).catchError((e){
      // return ActionResult<UserSession>.error();
    });
  }
}