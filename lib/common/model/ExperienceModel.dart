

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

      data['experience_data'] =
          this.experienceData!.map((v) => v.toJson()).toList();

    return data;
  }
}


class ExperienceModel{
  late String organizationName;
  late String designation;
  late String startDate;
  late bool completed;
  late bool isStillActive;
  late String endDate;

  ExperienceModel.empty(){
    organizationName = '';
    designation='';
    startDate='';
    completed =false;
    completed =false;
    endDate='';
  }

  ExperienceModel.fromJson(Map<String, dynamic> json) {
    organizationName = json['organization'];
    designation = json['designation'];
    startDate = json['from_date'];
    completed = json['is_left_job'];
    endDate = json['to_date'];
    isStillActive = json['is_still_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organizationName;
    data['designation'] = this.designation;
    data['from_date'] = this.startDate;
    data['is_left_job'] = this.completed;
    data['to_date'] = this.endDate;
    data['is_still_active'] = this.isStillActive;
    return data;
  }

}