import 'package:flutter/cupertino.dart';

abstract class _ViewModel{
  void navigateToHomeScreen();
  void navigateToLoginScreen();
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

}