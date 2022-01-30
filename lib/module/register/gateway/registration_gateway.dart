import 'package:resume_maker/common/core/server.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/UserSession.dart';

mixin RegistrtationGateway{
  static Future<ActionResult<UserSession>> doSignUp(String name,String email,String password, String confirm_password) async{
    return Server.instance.postRequest(
      url: "register",
      postData: {
        "name":name,
        "email":email,
        "password": password,
        "c_password": confirm_password
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