import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/common/widget/AlertBox.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';

abstract class _ViewModel{

  void showWarning(String message);
}


mixin ResumeCreateService<T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { });
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

  @override
  void dispose() {
    _stepNumberStreamController.close();
    _formTitleStreamController.close();
    _buttonStateStreamController.close();
    super.dispose();
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



  Future<bool> onBackPress() {

      return showPromptDialog(
        context: context,
        description:"Do you really want to exit? Your unsaved data will be lost.", onConfirm: false,
      );
    }
    bool validateAccountFormData(String name,String address, String contact_no){
        if(Validator.isEmpty(name)){
          _view.showWarning("Name is required!");
          return false;
        }
        else if(Validator.isEmpty(address)){
          _view.showWarning("Address is required!");
          return false;
        }
        else if(Validator.isEmpty(contact_no)){
          _view.showWarning("Contact Number is required!");
          return false;
        }
        else if(Validator.isValidMobileNo(contact_no)){
          _view.showWarning("Enter a Valid Bangladeshi Contact Number");
          return false;
        }

        else{
          return true;
        }

    }
  }
