import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/AcademicModel.dart';


import 'AccountsModel.dart';
import 'ImageModel.dart';
import 'SignatureModel.dart';

class UserDetailsModel{
 late String name;
 late String email;
 late String contactNo;
 late String address;
 late List<AcademicModel> academicData;

  UserDetailsModel.empty(){
    name = '';
    email='';
    contactNo='';
    address ='';
    academicData = [];
  }

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name']??"";
    email = json['email']??App.currentSession.email;
    contactNo = json['contact_no']??"";
    address = json['address']??"";
    academicData = <AcademicModel>[];
    if (json['academic_data'] != null) {

      json['academic_data'].forEach((v) {
        academicData.add(AcademicModel.fromJson(v)) ;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['address'] = this.address;
    data['academic_data'] =
        this.academicData.map((v) => v.toJson()).toList();
    return data;
  }

}




