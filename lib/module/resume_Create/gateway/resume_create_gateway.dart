
import 'dart:io';

import 'package:resume_maker/common/core/server.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ActionResult.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ImageModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';

mixin ResumeCreateGateway{
  static Future<ActionResult<AccountsModel>> saveAccountDetails(String name,
      String contact_no, String address) {
    return Server.instance.postRequest(
        url: 'user-update',
        postData: {
          "name": name,
          "contact_no": contact_no,
          "address": address
        }
    ).then((value) {
      return ActionResult<AccountsModel>.fromServerResponse(
        response: value,
        generateData: (x) => AccountsModel.empty(),
      );
    });
  }

  static Future<ActionResult<AccountsModel>> getAccountDetails() async {
    return Server.instance.getRequest(url: 'my-profile').then((value) {
      return ActionResult<AccountsModel>.fromServerResponse(
        response: value,
        generateData: (x) => AccountsModel.fromJson(x),
      );
    });
  }

  // ==================Academic===============================

  static Future<ActionResult<AcademicListModel>> setAcademicDetails(
      AcademicListModel e) {
    return Server.instance.postRequest(
      url: 'academic-create-or-update',
      postData: e.toJson(),
    ).then((value) {
      return ActionResult<AcademicListModel>.fromServerResponse(
        response: value,
        generateData: (x) => AcademicListModel.empty(),
      );
    });
  }

  static Future<ActionResult<AcademicListModel>> getAcademicDetails() async {
    return Server.instance.getRequest(url: 'user-academic-information-list')
        .then((value) {
      print(value);
      return ActionResult<AcademicListModel>.fromServerResponse(
        response: value,
        generateData: (x) => AcademicListModel.fromJsonList(x),
      );
    });
  }

  static Future<ActionResult<AcademicListModel>> deleteAcademicDetails(
      int id) async {
    return Server.instance.deleteRequest(
        url: 'user-academic-information-delete/${id}').then((value) {
      return ActionResult<AcademicListModel>.fromServerResponse(
        response: value,
        generateData: (x) => AcademicListModel.fromJsonList(x),
      );
    });
  }

// ==================Experience===============================

  static Future<ActionResult<ExperienceListModel>> setExperienceDetails(
      ExperienceListModel e) {
    return Server.instance.postRequest(
      url: 'user-experiences',
      postData: e.toJson(),
    ).then((value) {
      return ActionResult<ExperienceListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ExperienceListModel.empty(),
      );
    });
  }

  static Future<
      ActionResult<ExperienceListModel>> getExperienceDetails() async {
    return Server.instance.getRequest(url: 'user-experiences').then((value) {
      return ActionResult<ExperienceListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ExperienceListModel.fromJsonList(x),
      );
    });
  }

  static Future<ActionResult<ExperienceListModel>> deleteExperienceDetails(
      int id) async {
    return Server.instance.deleteRequest(url: 'user-experiences/${id}').then((
        value) {
      return ActionResult<ExperienceListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ExperienceListModel.fromJsonList(x),
      );
    });
  }

  // ==================Project===============================

  static Future<ActionResult<ProjectListModel>> setProjectDetails(
      ProjectListModel e) {
    return Server.instance.postRequest(
      url: 'user-projects',
      postData: e.toJson(),
    ).then((value) {
      return ActionResult<ProjectListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ProjectListModel.empty(),
      );
    });
  }

  static Future<ActionResult<ProjectListModel>> getProjectDetails() async {
    return Server.instance.getRequest(url: 'user-projects').then((value) {
      return ActionResult<ProjectListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ProjectListModel.fromJsonList(x),
      );
    });
  }

  static Future<ActionResult<ProjectListModel>> deleteProjectDetails(
      int id) async {
    return Server.instance.deleteRequest(url: 'user-projects/${id}').then((
        value) {
      return ActionResult<ProjectListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ProjectListModel.fromJsonList(x),
      );
    });
  }

  // ==================Reference===============================

  static Future<ActionResult<ReferenceListModel>> setReferenceDetails(
      ReferenceListModel e) {
    return Server.instance.postRequest(
      url: 'user-references',
      postData: e.toJson(),
    ).then((value) {
      return ActionResult<ReferenceListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ReferenceListModel.empty(),
      );
    });
  }

  static Future<ActionResult<ReferenceListModel>> getReferenceDetails() async {
    return Server.instance.getRequest(url: 'user-references').then((value) {
      return ActionResult<ReferenceListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ReferenceListModel.fromJsonList(x),
      );
    });
  }

  static Future<ActionResult<ReferenceListModel>> deleteReferenceDetails(
      int id) async {
    return Server.instance.deleteRequest(url: 'user-references/${id}').then((
        value) {
      return ActionResult<ReferenceListModel>.fromServerResponse(
        response: value,
        generateData: (x) => ReferenceListModel.fromJsonList(x),
      );
    });
  }
// ==========================Image=======================================
//   static Future<ActionResult<bool>> createPostSubmitRequest(
//       {
//         required String featureImage}) async {
//     Response response;
//     Dio dio = Dio();
//     dio.options.headers["Authorization"] = "${App.currentSession.tokenType} ${App.currentSession.accessToken}";
//
//
//
//     try {
//       FormData formData = FormData.fromMap({
//         "feature_image": MultipartFile.fromFileSync(featureImage,
//             filename: featureImage.split("/").last)
//       });
//       response = await dio.post(
//         "${Server.host}${'user-profile-image-update'}",
//         data: formData,
//       );
//       return ActionResult<bool>.fromServerResponse(
//         response: ServerResponse(message: 'Post create successfully done.', success: true, data: true),
//         generateData: (x) => x,
//       );
//       print(response.data);
//     } catch (e) {
//       return ActionResult<bool>.fromServerResponse(
//         response: ServerResponse(message: '', success: false, data: false),
//         generateData: (x) => x,
//       );
//     }
//   }
//
//   static Future<ActionResult<ImageModel>> getImage() async{
//     return Server.instance.getRequest(url:'my-profile' ).then((value){
//
//       return ActionResult<ImageModel>.fromServerResponse(
//         response: value,
//         generateData: (x)=> ImageModel.fromJson(x),
//       );
//     });
//   }

  static Future<ActionResult<ImageModel>> getProfileData() async{
    return Server.instance.getRequest(
      url: "my-profile",
    ).then((value){
      return ActionResult<ImageModel>.fromServerResponse(
        response: value,
        generateData: (x)=> ImageModel.fromJson(x),
      );
    });
  }

  static void   uploadProfilePic(File file, void Function(ActionResult<ImageModel>)  onComplete) async{
    Server.instance.uploadFile(
        url: "user-profile-image-update",
        file: file,
        onComplete: (response){
          onComplete.call( ActionResult<ImageModel>.fromServerResponse(
            response: response,
            generateData: (x)=> x,
          ));
        }
    );
  }
 }





