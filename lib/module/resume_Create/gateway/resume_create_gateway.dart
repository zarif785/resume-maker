import 'package:resume_maker/common/core/server.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';

mixin ResumeCreateGateway{
  static Future<ActionResult<AccountsModel>> saveAccountDetails(String name,String contact_no,String address ){
    return Server.instance.postRequest(
        url: 'user-update',
        postData:{
          "name" : name,
          "contact_no" :contact_no,
          "address" : address
        }
    ).then((value)  {
      return ActionResult<AccountsModel>.fromServerResponse(
      response: value,
      generateData: (x)=> AccountsModel.empty(),
    );
    });
  }

  static Future<ActionResult<AccountsModel>> getAccountDetails() async{
    return Server.instance.getRequest(url:'my-profile' ).then((value){

      return ActionResult<AccountsModel>.fromServerResponse(
        response: value,
        generateData: (x)=> AccountsModel.fromJson(x),
      );
    });
  }

  // ==================Academic===============================

  static Future<ActionResult<AcademicListModel>> setAcademicDetails( AcademicListModel e ){
    return Server.instance.postRequest(
        url: 'academic-create-or-update',
        postData: e.toJson(),
    ).then((value)  {
      return ActionResult<AcademicListModel>.fromServerResponse(
      response: value,
      generateData: (x)=> AcademicListModel.empty(),
    );
    });
  }

  static Future<ActionResult<AcademicListModel>> getAcademicDetails() async{
    return Server.instance.getRequest(url: 'user-academic-information-list').then((value){
      print(value);
      return ActionResult<AcademicListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> AcademicListModel.fromJsonList(x) ,
      );

    });
  }



// ==================Experience===============================

  static Future<ActionResult<ExperienceListModel>> setExperienceDetails( ExperienceListModel e ){
    return Server.instance.postRequest(
      url: 'user-experiences',
      postData: e.toJson(),
    ).then((value)  {
      return ActionResult<ExperienceListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ExperienceListModel.empty(),
      );
    });
  }

  static Future<ActionResult<ExperienceListModel>> getExperienceDetails() async{
    return Server.instance.getRequest(url: 'user-experiences').then((value){

      return ActionResult<ExperienceListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ExperienceListModel.fromJsonList(x),
      );
    });
  }

  // ==================Project===============================

  static Future<ActionResult<ProjectListModel>> setProjectDetails( ProjectListModel e ){
    return Server.instance.postRequest(
      url: 'user-projects',
      postData: e.toJson(),
    ).then((value)  {
      return ActionResult<ProjectListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ProjectListModel.empty(),
      );
    });
  }

  static Future<ActionResult<ProjectListModel>> getProjectDetails() async{
    return Server.instance.getRequest(url: 'user-projects').then((value){

      return ActionResult<ProjectListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ProjectListModel.fromJsonList(x),
      );
    });
  }

  // ==================Reference===============================

  static Future<ActionResult<ReferenceListModel>> setReferenceDetails( ReferenceListModel e ){
    return Server.instance.postRequest(
      url: 'user-references',
      postData: e.toJson(),
    ).then((value)  {
      return ActionResult<ReferenceListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ReferenceListModel.empty(),
      );
    });
  }

  static Future<ActionResult<ReferenceListModel>> getReferenceDetails() async{
    return Server.instance.getRequest(url: 'user-references').then((value){

      return ActionResult<ReferenceListModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ReferenceListModel.fromJsonList(x),
      );
    });
  }

}