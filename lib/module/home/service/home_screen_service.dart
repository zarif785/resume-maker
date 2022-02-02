import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/widget/AlertBox.dart';

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

  Future<bool> onBackPress() {

    return showPromptDialog(
      context: context,
      description:"Do you really want to exit? Your unsaved data will be lost.", onConfirm: true,
    );
  }

 void onUpdate(){
    _view.navigateToUpdateResumeScreen();
 }

  void onCreate(){
    _view.navigateToCreateResumeScreen();
  }
}