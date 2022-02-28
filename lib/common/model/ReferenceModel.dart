
class ReferenceListModel {
  late List<ReferenceModel> referenceData;


  ReferenceListModel.empty(){
    referenceData = [];
  }

  ReferenceListModel.fromJson(Map<String, dynamic> json) {
    referenceData = <ReferenceModel>[];

    if (json['reference_data'] != null) {

      json['reference_data'].forEach((v) {
        referenceData.add(new ReferenceModel.fromJson(v));
      });
    }
  }

  ReferenceListModel.fromJsonList(List<dynamic>? json) {
    referenceData = <ReferenceModel>[];
    if (json != null) {
      json.forEach((v) {
        referenceData.add(ReferenceModel.fromJson(v)) ;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

      data['reference_data'] =
          this.referenceData.map((v) => v.toJson()).toList();

    return data;
  }
}

class ReferenceModel{
  late String name;
  late String designation;
  late String organization;
  late String email;
  late String contactNo;

  ReferenceModel.empty(){
    name='';
    designation='';
    organization='';
    email='';
    contactNo='';
  }

  ReferenceModel.fromJson(Map<String, dynamic> json) {
    name = json['name']??'';
    designation = json['designation']??'';
    organization = json['organization']??'';
    email = json['email']??'';
    contactNo = json['mobile']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['organization'] = this.organization;
    data['email'] = this.email;
    data['mobile'] = this.contactNo;
    return data;
  }
}