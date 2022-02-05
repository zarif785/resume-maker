import 'package:resume_maker/common/core/server.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';

mixin ResumeUpdateGateway {
  static Future<ActionResult<AccountsModel>> getAccountDetails() async{
    return Server.instance.getRequest(url: 'user-details').then((value){

      return ActionResult<AccountsModel>.fromServerResponse(
        response: value,
        generateData: (x)=> AccountsModel.fromJson(x),
      );
    });
  }
}
