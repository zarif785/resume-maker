import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/model/UserDetailsModel.dart';
import 'package:resume_maker/module/resume_Create/gateway/resume_create_gateway.dart';

mixin ResumeDisplayService<T extends StatefulWidget> on State<T>{

  UserDetailsModel _userDetailsModel = UserDetailsModel();

  StreamController<PageState> _userInfoStreamController =
  StreamController.broadcast();

  Stream<PageState> get userInfoStream => _userInfoStreamController.stream;

  Sink<PageState>? get _userInfoSink =>
      !_userInfoStreamController.isClosed
          ? _userInfoStreamController.sink
          : null;


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

}



abstract class PageState {}

class LoadingState extends PageState {}

class EmptyState extends PageState {}

class DataLoadedState extends PageState {
  final UserDetailsModel data;
  DataLoadedState(this.data);
}
// class AcademicLoadedState extends PageState {
//   final AcademicListModel data;
//   AcademicLoadedState(this.data);
// }
// class ExperienceLoadedState extends PageState {
//   final ExperienceListModel data;
//   ExperienceLoadedState(this.data);
// }
// class ProjectLoadedState extends PageState {
//   final ProjectListModel data;
//   ProjectLoadedState(this.data);
// }
// class ReferenceLoadedState extends PageState {
//   final ReferenceListModel data;
//   ReferenceLoadedState(this.data);
// }


