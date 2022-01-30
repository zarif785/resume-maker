import 'package:flutter/cupertino.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/UserSession.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/module/register/gateway/registration_gateway.dart';

abstract class _ViewModel{
  void navigateToHomeScreen();
  void navigateToLoginScreen();

  void showWarning(String s) {}
}

mixin RegisterScreenService <T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {});
  }

  Future<void> onLoginPress() async{
    await Future.delayed(Duration(milliseconds: 100));
    _view.navigateToLoginScreen();

  }
  bool validateRegisterFormData(TextEditingController nameController,TextEditingController emailController, TextEditingController passwordController,TextEditingController confirmPasswordController)  {
    if(Validator.isEmpty(nameController.text)){
      _view.showWarning("Name is required!");
      return false;
    }
    else if(Validator.isEmpty(emailController.text)){
      _view.showWarning("Email is required!");
      return false;
    }    else if(Validator.isEmpty(passwordController.text)){
      _view.showWarning("Password is required!");
      return false;
    }    else if(Validator.isEmpty(confirmPasswordController.text)){
      _view.showWarning("Confirm Password!");
      return false;
    }else{
      return true;
    }
  }

  Future<ActionResult<UserSession>> doSignUp(TextEditingController nameController,TextEditingController emailController,TextEditingController passwordController, TextEditingController confirmPasswordController) async{
    return RegistrtationGateway.doSignUp(nameController.text.trim(),emailController.text.trim(), passwordController.text.trim(), confirmPasswordController.text.trim()).then((value){
      if(value.isSuccess != true){
        _view.showWarning(value.message);
      }
      return value;
    });
  }

  // Future<void> onRegisterButtonPress() async{
  //   await Future.delayed(Duration(milliseconds: 1000));
  //   _view.navigateToHomeScreen();
  //
  // }

  void onRegisterSuccess(UserSession data) {
    Future.delayed(Duration(milliseconds: 1000));
    App.setCurrentSession(data).then((value){
      _view.navigateToHomeScreen();
    });
  }

}