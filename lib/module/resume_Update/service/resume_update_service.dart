import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/module/resume_Update/gateway/resume_update_gateway.dart';

mixin ResumeUpdateService<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    // _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { });
  }

  StreamController<PageState> _accountsInfoStreamController =
  StreamController.broadcast();

  Stream<PageState> get accountsInfoStream => _accountsInfoStreamController.stream;

  Sink<PageState>? get _accountsInfoSink =>
      !_accountsInfoStreamController.isClosed
          ? _accountsInfoStreamController.sink
          : null;


    getAccountsDetails(){
    return ResumeUpdateGateway.getAccountDetails().then((value){
      if(value.isSuccess==true){
        _accountsInfoSink!.add(DataLoadedState(value.data!));

      }
    });
  }

}

abstract class PageState {}

class LoadingState extends PageState {}

class EmptyState extends PageState {}

class DataLoadedState extends PageState {
  final AccountsModel data;
  DataLoadedState(this.data);
}
