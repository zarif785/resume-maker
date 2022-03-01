import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/module/resume_Create/gateway/resume_create_gateway.dart';

mixin ResumeDisplayService<T extends StatefulWidget> on State<T>{
  StreamController<PageState> _userInfoStreamController =
  StreamController.broadcast();

  Stream<PageState> get userInfoStream => _userInfoStreamController.stream;

  Sink<PageState>? get _userInfoSink =>
      !_userInfoStreamController.isClosed
          ? _userInfoStreamController.sink
          : null;

  getAllData(){
    getAccountsDetails();
    getAcademicDetails();
    getExperienceDetails();

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


