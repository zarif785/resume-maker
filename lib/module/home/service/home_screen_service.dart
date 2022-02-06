import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/widget/AlertBox.dart';

abstract class _ViewModel{
  void navigateToUpdateResumeScreen();
  void navigateToCreateResumeScreen();
}

mixin HomeScreenService <T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  StreamController<PageState> _accountsInfoStreamController =
  StreamController.broadcast();

  Stream<PageState> get accountsInfoStream => _accountsInfoStreamController.stream;

  Sink<PageState>? get _accountsInfoSink =>
      !_accountsInfoStreamController.isClosed
          ? _accountsInfoStreamController.sink
          : null;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { });
  }

  Future<bool> onBackPress() {

    return showPromptDialog(
      context: context,
      description:"Do you really want to exit? ", onConfirm: true,
    );
  }

 void onUpdate(){
    _view.navigateToUpdateResumeScreen();
 }

  void onCreate(){
    _view.navigateToCreateResumeScreen();
  }
}

abstract class PageState {}

class LoadingState extends PageState {}

class EmptyState extends PageState {}

class DataLoadedState extends PageState {
  final AccountsModel data;
  DataLoadedState(this.data);
}
