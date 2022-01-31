import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/core/app.dart';

abstract class _ViewModel{
  void navigateToUpdateResumeScreen();
  void navigateToCreateResumeScreen();
}

mixin HomeScreenService <T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;
  final TextEditingController _userNameController =
      TextEditingController();

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { });
  }



 void onUpdate(){
    _view.navigateToUpdateResumeScreen();
 }

  void onCreate(){
    _view.navigateToCreateResumeScreen();
  }
}