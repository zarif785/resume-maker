import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ImageModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/model/UserDetailsModel.dart';
import 'package:resume_maker/common/utils/Toasty.dart';
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getAccountsDetails();
    });
  }

  UserDetailsModel _userDetailsModel = UserDetailsModel();

  getAccountsDetails()async{
    ResumeCreateGateway.getAccountDetails().then((value){
      if(value.isSuccess==true) {
        _userDetailsModel.accountsModel = value.data;
      }
    });
    await ResumeCreateGateway.getAcademicDetails().then((value_academic){
      if(value_academic.isSuccess==true){
        _userDetailsModel.academicListModel = value_academic.data;

      }
    });
    await ResumeCreateGateway.getExperienceDetails().then((value_exp){
      if(value_exp.isSuccess==true){
        _userDetailsModel.experienceListModel = value_exp.data;

      }
    });
    await  ResumeCreateGateway.getProjectDetails().then((value_project){
      if(value_project.isSuccess==true){
        _userDetailsModel.projectListModel = value_project.data;

      }
    });
    Future.delayed(Duration(seconds: 4));
    await ResumeCreateGateway.getReferenceDetails().then((value_reference){
      if(value_reference.isSuccess==true){
        _userDetailsModel.referenceListModel = value_reference.data;}

    });
    _userInfoSink!.add(DataLoadedState(_userDetailsModel));



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

  StreamController<bool> _buttonStateStreamController =
  StreamController.broadcast();

  Stream<bool> get buttonStateStream => _buttonStateStreamController.stream;

  Sink<bool>? get _buttonStateSink =>
      !_buttonStateStreamController.isClosed
          ? _buttonStateStreamController.sink
          : null;


  StreamController<bool> _addButtonStreamController =
  StreamController.broadcast();

  Stream<bool> get addButtonStream => _addButtonStreamController.stream;

  Sink<bool>? get addButtonSink =>
      !_addButtonStreamController.isClosed
          ? _addButtonStreamController.sink
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
      addButtonSink!.add(false);


      getAccountsDetails();
    } else if (index == 1){
      _formTitleSink!.add("Academic");
      addButtonSink!.add(true);
      getAccountsDetails();


    } else if (index == 2) {
      _formTitleSink!.add("Experience");
      addButtonSink!.add(true);



      getAccountsDetails();
    } else if (index == 3) {
      _formTitleSink!.add("Project");
      addButtonSink!.add(true);


      getAccountsDetails();
    } else if (index == 4) {
      _formTitleSink!.add("Reference");
      addButtonSink!.add(true);



    } else if (index == 5) {
      _formTitleSink!.add("Image");
      addButtonSink!.add(false);

    } else {
      _formTitleSink!.add("Signature");
      addButtonSink!.add(false);
 
    }

    if(index==6){
      _buttonStateSink!.add(true);

    }
    else{
      _buttonStateSink!.add(false);
    }

  }


  // getAcademicDetails() {
  //    return ResumeCreateGateway.getAcademicDetails().then((value){
  //     if(value.isSuccess==true){
  //       _userInfoSink!.add(AcademicLoadedState(value.data!));
  //     }
  //   });
  // }
  //
  // getExperienceDetails() {
  //   return ResumeCreateGateway.getExperienceDetails().then((value){
  //     if(value.isSuccess==true){
  //       _userInfoSink!.add(ExperienceLoadedState(value.data!));
  //     }
  //   });
  // }
  // getProjectDetails() {
  //   return ResumeCreateGateway.getProjectDetails().then((value){
  //     if(value.isSuccess==true){
  //       _userInfoSink!.add(ProjectLoadedState(value.data!));
  //     }
  //   });
  // }
  //
  // getReferenceDetails() {
  //   return ResumeCreateGateway.getReferenceDetails().then((value){
  //     if(value.isSuccess==true){
  //       _userInfoSink!.add(ReferenceLoadedState(value.data!));
  //     }
  //   });
  // }

  // getImageDetails() {
  //   return ResumeCreateGateway.getImage().then((value){
  //     if(value.isSuccess==true){
  //       _userInfoSink!.add(ImageLoadedState(value.data!));
  //     }
  //   });
  // }



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
        addButtonSink!.add(true);
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

  // void setImage(String path){
  //   ResumeCreateGateway.createPostSubmitRequest(featureImage: path).then((value){
  //     if(value.isSuccess == true){
  //       print(value.message);
  //       _view.showWarning(value.message,value.isSuccess);
  //     }
  //     else{
  //       // print();
  //       _view.showWarning("fail",value.isSuccess);
  //     }
  //   }).catchError((e){
  //     print(e);
  //   });
  // }

  deleteAcademicInfo(int id){
    return ResumeCreateGateway.deleteAcademicDetails(id).then((value){
      if(value.isSuccess==true){
        // _userInfoSink!.add(AcademicLoadedState(value.data!));
        Toasty.of(context).showSuccess("Deleted Successfully");
      }
    });
  }

  deleteExperienceInfo(int id){
    return ResumeCreateGateway.deleteExperienceDetails(id).then((value){
      if(value.isSuccess==true){
        // _userInfoSink!.add(AcademicLoadedState(value.data!));
        Toasty.of(context).showSuccess("Deleted Successfully");
      }
    });
  }

  deleteProjectInfo(int id){
    return ResumeCreateGateway.deleteProjectDetails(id).then((value){
      if(value.isSuccess==true){
        // _userInfoSink!.add(AcademicLoadedState(value.data!));
        Toasty.of(context).showSuccess("Deleted Successfully");
      }
    });
  }

  deleteReferenceInfo(int id){
    return ResumeCreateGateway.deleteReferenceDetails(id).then((value){
      if(value.isSuccess==true){
        // _userInfoSink!.add(AcademicLoadedState(value.data!));
        Toasty.of(context).showSuccess("Deleted Successfully");
      }
    });
  }

  void addButtonHandler(int i){
    if(i==1){
      bool flag = _userDetailsModel.academicListModel!.academicData.any((element) => element.id==0);
      if(flag){addButtonSink!.add(false);}
      else{
        addButtonSink!.add(true);
      }
    }
    if(i==2){
      bool flag = _userDetailsModel.experienceListModel!.experienceData.any((element) => element.id==0);
      if(flag){addButtonSink!.add(false);}
      else{
        addButtonSink!.add(true);
      }
    }
    if(i==3){
      bool flag = _userDetailsModel.projectListModel!.projectData.any((element) => element.id==0);
      if(flag){addButtonSink!.add(false);}
      else{
        addButtonSink!.add(true);
      }
    }
    if(i==4){
      bool flag = _userDetailsModel.referenceListModel!.referenceData.any((element) => element.id==0);
      if(flag){addButtonSink!.add(false);}
      else{
        addButtonSink!.add(true);
      }
    }

  }

}

abstract class PageState {}

class LoadingState extends PageState {}

class EmptyState extends PageState {}

class DataLoadedState extends PageState {
  final UserDetailsModel data;
  DataLoadedState(this.data);
}





