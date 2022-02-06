import 'package:resume_maker/common/core/server.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';

mixin ResumeUpdateGateway {
  static Future<ActionResult<AccountsModel>> getAccountDetails() async{
    return Server.instance.getRequest(url: 'my-profile').then((value){

      return ActionResult<AccountsModel>.fromServerResponse(
        response: value,
        generateData: (x)=> AccountsModel.fromJson(x),
      );
    });
  }

  static Future<ActionResult<AccountsModel>> saveAccountDetails(String name,String contact_no,String address ){
    return Server.instance.postRequest(
        url: 'user-update',
        postData:{
          "name" : name,
          "contact_no" :contact_no,
          "address" : address
        }
    ).then((value)  {
      return ActionResult<AccountsModel>.fromServerResponse(
        response: value,
        generateData: (x)=> AccountsModel.fromJson(x),
      );
    });
  }
}
