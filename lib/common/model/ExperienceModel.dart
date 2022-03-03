

class ExperienceListModel {
 late  List<ExperienceModel> experienceData;

  ExperienceListModel.empty(){
    experienceData = [];
  }

  ExperienceListModel.fromJson(Map<String, dynamic> json) {
    experienceData = <ExperienceModel>[];
    if (json['experience_data'] != null) {

      json['experience_data'].forEach((v) {
        experienceData.add(new ExperienceModel.fromJson(v));
      });
    }
  }

 ExperienceListModel.fromJsonList(List<dynamic>? json) {
   experienceData = <ExperienceModel>[];
   if (json != null) {
     json.forEach((v) {
       experienceData.add(ExperienceModel.fromJson(v)) ;
     });
   }
 }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

      data['experience_data'] =
          this.experienceData.map((v) => v.toJson()).toList();

    return data;
  }
}


class ExperienceModel{
  late int id;
  late String organizationName;
  late String designation;
  late String startDate;
  late bool completed;
  late bool isStillActive;
  late String endDate;

  ExperienceModel.empty(){
    id  = 0;
    organizationName = '';
    designation='';
    startDate='';
    completed =false;
    completed =false;
    endDate='';
  }

  ExperienceModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]??0;
    organizationName = json['organization']??"";
    designation = json['designation']??'';
    startDate = json['from_date']??'';
    completed = json['is_left_job']??false;
    endDate = json['to_date']??"";
     isStillActive = json['is_still_active']??"false";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']= this.id;
    data['organization'] = this.organizationName;
    data['designation'] = this.designation;
    data['from_date'] = this.startDate;
    data['is_left_job'] = false;
    data['to_date'] = this.endDate;
    data['is_still_active'] = false;
    return data;
  }

}