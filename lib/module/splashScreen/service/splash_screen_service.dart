import 'package:flutter/cupertino.dart';
import 'package:resume_maker/common/core/app.dart';

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

  void _fetchUserSession() async{
    ///Delayed for 2 seconds
    await Future.delayed(const Duration(milliseconds:2000));

    ///Navigate to logical page
    App.getCurrentSession().then((session)async{
      if(session.isEmpty){
        ///Navigate to login screen
        _view.navigateToLoginScreen();
      }else{
        ///Navigate to Home screen
        _view.navigateToHomeScreen();
      }
    });
  }

  }

