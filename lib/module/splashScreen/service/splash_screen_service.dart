import 'package:flutter/cupertino.dart';

abstract class _ViewModel{
  void navigateToHomeScreen();
  void navigateToLoginScreen();
}

mixin SplashScreenService <T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { _fetchUserSession();});
  }

  Future<void> _fetchUserSession() async{
    await Future.delayed(Duration(milliseconds: 3000));
    _view.navigateToLoginScreen();

  }

  }