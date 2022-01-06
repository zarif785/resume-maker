import 'package:flutter/cupertino.dart';

abstract class _ViewModel{
  void navigateToHomeScreen();
  void navigateToRegisterScreen();
}

mixin LoginScreenService <T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { });
  }

  Future<void> onRegisterPress() async{
    await Future.delayed(Duration(milliseconds: 100));
    _view.navigateToRegisterScreen();

  }

  Future<void> onLoginButtonPress() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _view.navigateToHomeScreen();

  }

}