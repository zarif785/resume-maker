import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';

class UserDetailsModel{

  AccountsModel? accountsModel;
  AcademicListModel? academicListModel;
  ExperienceListModel? experienceListModel;
  ProjectListModel? projectListModel;
  ReferenceListModel? referenceListModel;


  UserDetailsModel({this.accountsModel,this.academicListModel,this.experienceListModel,this.referenceListModel,this.projectListModel});



}