import 'package:flutter/cupertino.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/UserSession.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/module/login/gateway/login_gateway.dart';

abstract class _ViewModel{
  void navigateToHomeScreen();
  void navigateToRegisterScreen();
  void showWarning(String message);
}

mixin LoginScreenService <T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { });
  }


  bool validateLoginFormData(TextEditingController emailController, TextEditingController passwordController)  {
    if(Validator.isEmpty(emailController.text)){
      _view.showWarning("Email is required!");
      return false;
    }
    else if(Validator.isEmpty(passwordController.text)){
      _view.showWarning("Password is required!");
      return false;
    }else{
      return true;
    }
  }

  Future<ActionResult<UserSession>> doLogIn(TextEditingController emailController, TextEditingController passwordController) async{
    return LoginGateway.doLogin(emailController.text.trim(), passwordController.text.trim()).then((value){
      if(value.isSuccess != true){
        _view.showWarning(value.message);
      }
      return value;
    });
  }

  Future<void> onRegisterPress() async{
    // await Future.delayed(Duration(milliseconds: 100));
    _view.navigateToRegisterScreen();

  }
  //
  // Future<void> onLoginButtonPress() async{
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   _view.navigateToHomeScreen();
  //
  // }
  void onLoginSuccess(UserSession data) {
    Future.delayed(Duration(milliseconds: 1000));
    App.setCurrentSession(data).then((value){
      _view.navigateToHomeScreen();
    });
  }
}