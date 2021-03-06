import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/common/widget/AlertBox.dart';
import 'package:resume_maker/module/resume_Update/gateway/resume_update_gateway.dart';


abstract class _ViewModel{

  void showWarning(String message,bool successValue);
}


mixin ResumeUpdateService<T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;
  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { getAcademicDetails();});
  }


  StreamController<String> _stepNumberStreamController =
  StreamController.broadcast();

  Stream<String> get stepNumberStream => _stepNumberStreamController.stream;

  Sink<String>? get _stepNumberSink =>
      !_stepNumberStreamController.isClosed
          ? _stepNumberStreamController.sink
          : null;


  StreamController<String> _formTitleStreamController =
  StreamController.broadcast();

  Stream<String> get formTitleStream => _formTitleStreamController.stream;

  Sink<String>? get _formTitleSink =>
      !_formTitleStreamController.isClosed
          ? _formTitleStreamController.sink
          : null;

  StreamController<int> _buttonStateStreamController =
  StreamController.broadcast();

  Stream<int> get buttonStateStream => _buttonStateStreamController.stream;

  Sink<int>? get _buttonStateSink =>
      !_buttonStateStreamController.isClosed
          ? _buttonStateStreamController.sink
          : null;

  StreamController<PageState> _academicInfoStreamController =
  StreamController.broadcast();

  Stream<PageState> get academicInfoStream => _academicInfoStreamController.stream;

  Sink<PageState>? get _academicInfoSink =>
      !_academicInfoStreamController.isClosed
          ? _academicInfoStreamController.sink
          : null;


  getAcademicDetails() {
     ResumeUpdateGateway.getAcademicDetails().then((value){
      if(value.isSuccess==true){
        _academicInfoSink!.add(DataLoadedState(value.data!));
      }
    });
  }


  @override
  void dispose() {
    _stepNumberStreamController.close();
    _formTitleStreamController.close();
    _buttonStateStreamController.close();

    super.dispose();
  }



  Future<bool> onBackPress() {

    return showPromptDialog(
      context: context,
      description:"Do you really want to exit? Your unsaved data will be lost.", onConfirm: false,
    );
  }
  onContentChanged(int index) {
    _stepNumberSink!.add("Step ${index + 1} out of ${7}");
    if (index == 0) {
      _formTitleSink!.add("Account");
    } else if (index == 1) {
      _formTitleSink!.add("Academic");
    } else if (index == 2) {
      _formTitleSink!.add("Experience");
    } else if (index == 3) {
      _formTitleSink!.add("Project");
    } else if (index == 4) {
      _formTitleSink!.add("Reference");
    } else if (index == 5) {
      _formTitleSink!.add("Image");
    } else {
      _formTitleSink!.add("Signature");
    }

    if (index == 0) {
      _buttonStateSink!.add(1);
    }
    else if (index == 6) {
      _buttonStateSink!.add(3);
    }
    else {
      _buttonStateSink!.add(2);
    }
  }

  Future<bool> validateAccountFormData(String name,String address, String contact_no){
    Completer<bool> _completer = Completer();
    if(Validator.isEmpty(name)){
      _view.showWarning("Name is required!",false);
      _completer.complete(false);
      return _completer.future;
    }
    else if(Validator.isEmpty(address)){
      _view.showWarning("Address is required!",false);
      _completer.complete(false);
      return _completer.future;
    }
    else if(Validator.isEmpty(contact_no)){
      _view.showWarning("Contact Number is required!",false);
      _completer.complete(false);
      return _completer.future;
    }
    // else if(Validator.isValidMobileNumber(contact_no)){
    //   _view.showWarning("Enter a Valid Bangladeshi Contact Number");
    //   return false;
    // }

    else{
      _view.showWarning("Updated Successfully!",true);
      _completer.complete(true);
      return _completer.future;
    }

  }

  void saveDetails(String name, String contact_no, String address) async{
    return ResumeUpdateGateway.saveAccountDetails(name.trim(), contact_no.trim(), address.trim()).then((value){
      if(value.isSuccess != true){
        _view.showWarning(value.message,value.isSuccess);
      }
    });
  }


}

abstract class PageState {}

class LoadingState extends PageState {}

class EmptyState extends PageState {}

class DataLoadedState extends PageState {
  final AcademicListModel data;
  DataLoadedState(this.data);
}
