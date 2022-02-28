import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/utils/validator.dart';
import 'package:resume_maker/common/widget/AlertBox.dart';
import 'package:resume_maker/module/resume_Create/gateway/resume_create_gateway.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/academic.dart';

abstract class _ViewModel{

  void showWarning(String message,bool successValue);
}


mixin ResumeCreateService<T extends StatefulWidget> on State<T> implements _ViewModel{
  late _ViewModel _view;

  @override
  void initState() {
    _view = this;
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {      getAccountsDetails(); });
  }




  StreamController<PageState> _userInfoStreamController =
  StreamController.broadcast();

  Stream<PageState> get userInfoStream => _userInfoStreamController.stream;

  Sink<PageState>? get _userInfoSink =>
      !_userInfoStreamController.isClosed
          ? _userInfoStreamController.sink
          : null;

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
    _userInfoStreamController.close();
    super.dispose();
  }


  onContentChanged(int index) {
    _stepNumberSink!.add("Step ${index + 1} out of ${7}");
    if (index == 0) {
      _formTitleSink!.add("Account");
      getAccountsDetails();
    } else if (index == 1) {
      _formTitleSink!.add("Academic");
      getAcademicDetails();
    } else if (index == 2) {
      _formTitleSink!.add("Experience");
      getExperienceDetails();
    } else if (index == 3) {
      _formTitleSink!.add("Project");
      getProjectDetails();
    } else if (index == 4) {
      _formTitleSink!.add("Reference");
      getReferenceDetails();
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

  getAccountsDetails(){
    return ResumeCreateGateway.getAccountDetails().then((value){
      if(value.isSuccess==true){
        _userInfoSink!.add(DataLoadedState(value.data!));

      }
      return value.data;
    });
  }


  getAcademicDetails() {
     return ResumeCreateGateway.getAcademicDetails().then((value){
      if(value.isSuccess==true){
        _userInfoSink!.add(AcademicLoadedState(value.data!));
      }
    });
  }

  getExperienceDetails() {
    return ResumeCreateGateway.getExperienceDetails().then((value){
      if(value.isSuccess==true){
        _userInfoSink!.add(ExperienceLoadedState(value.data!));
      }
    });
  }
  getProjectDetails() {
    return ResumeCreateGateway.getProjectDetails().then((value){
      if(value.isSuccess==true){
        _userInfoSink!.add(ProjectLoadedState(value.data!));
      }
    });
  }

  getReferenceDetails() {
    return ResumeCreateGateway.getReferenceDetails().then((value){
      if(value.isSuccess==true){
        _userInfoSink!.add(ReferenceLoadedState(value.data!));
      }
    });
  }



  Future<bool> onBackPress() {

      return showPromptDialog(
        context: context,
        description:"Do you really want to exit? Your unsaved data will be lost.", onConfirm: false,
      );
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
        // else if(Validator.isValidMobile(contact_no)){
        //   _view.showWarning("Enter a Valid Bangladeshi Contact Number",false);
        //   _completer.complete(false);
        //   return _completer.future;
        // }

        else{

          _completer.complete(true);
          return _completer.future;
        }

    }

    Future<bool> validateAcademicFormData(String examName,String institute,String cgpa){
    Completer<bool> _completer = Completer();
        if(Validator.isEmpty(examName)){
          _view.showWarning("Exam name is required!",false);
          _completer.complete(false);
          return _completer.future;
        }
        else if(Validator.isEmpty(institute)){
          _view.showWarning("Institute name is required!",false);
          _completer.complete(false);
          return _completer.future;
        }
        // else if(isCompleted == true && Validator.isEmpty(year)){
        //   _view.showWarning("Passing Year is required!",false);
        //   _completer.complete(false);
        //   return _completer.future;
        // }
        else if( Validator.isEmpty(cgpa)){
          _view.showWarning("CGPA is required!",false);
          _completer.complete(false);
          return _completer.future;
        }
        else{
          _completer.complete(true);
          return _completer.future;
        }

    }
  void saveDetails(String name, String contact_no, String address) async{
    return ResumeCreateGateway.saveAccountDetails(name.trim(), contact_no.trim(), address.trim()).then((value){
      if(value.isSuccess == true){
        _view.showWarning(value.message,value.isSuccess);
      }
      print(value.message);
    });
  }

  void setAcademicDetails(AcademicListModel list){
    ResumeCreateGateway.setAcademicDetails(list).then((value)  {
      if(value.isSuccess == true){
        _view.showWarning(value.message,value.isSuccess);
      }
      // else{
      //   _view.showWarning(value.message,value.isSuccess);
      // }
      print(value.message);
    }).catchError((e){
      print(e);
    });
  }
  void setExperienceDetails(ExperienceListModel list){
    ResumeCreateGateway.setExperienceDetails(list).then((value)  {
      if(value.isSuccess == true){
        _view.showWarning(value.message,value.isSuccess);
      }
      // else{
      //   _view.showWarning(value.message,value.isSuccess);
      // }
      print(value.message);
    }).catchError((e){
      print(e);
    });
  }

  void setProjectDetails(ProjectListModel list){
    ResumeCreateGateway.setProjectDetails(list).then((value)  {
      if(value.isSuccess == true){
        _view.showWarning(value.message,value.isSuccess);
      }
      // else{
      //   _view.showWarning(value.message,value.isSuccess);
      // }
      print(value.message);
    }).catchError((e){
      print(e);
    });
  }

  void setReferenceDetails(ReferenceListModel list){
    ResumeCreateGateway.setReferenceDetails(list).then((value)  {
      if(value.isSuccess == true){
        _view.showWarning(value.message,value.isSuccess);
      }
      else{
        _view.showWarning(value.message,value.isSuccess);
      }
      print(value.message);
    }).catchError((e){
      print(e);
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
class AcademicLoadedState extends PageState {
  final AcademicListModel data;
  AcademicLoadedState(this.data);
}
class ExperienceLoadedState extends PageState {
  final ExperienceListModel data;
  ExperienceLoadedState(this.data);
}
class ProjectLoadedState extends PageState {
  final ProjectListModel data;
  ProjectLoadedState(this.data);
}
class ReferenceLoadedState extends PageState {
  final ReferenceListModel data;
  ReferenceLoadedState(this.data);
}




