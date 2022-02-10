
class AcademicListModel {
  late List<AcademicModel> academicData;

  AcademicListModel.empty(){
    academicData = [];
  }

  AcademicListModel.fromJson(Map<String, dynamic> json) {
    academicData = <AcademicModel>[];
    if (json['academic_data'] != null) {

      json['academic_data'].forEach((v) {
        academicData.add(AcademicModel.fromJson(v)) ;
      });
    }
  }

  AcademicListModel.fromJsonList(List<dynamic>? json) {
    academicData = <AcademicModel>[];
    if (json != null) {
      json.forEach((v) {
        academicData.add(AcademicModel.fromJson(v)) ;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
      data['academic_data'] =
          this.academicData.map((v) => v.toJson()).toList();
    return data;
  }
}

class AcademicModel{
 late String examName;
 late String institute;
 late double cgpa;
 late int year;
 late bool isCompleted;
 late bool isPursuing;

  AcademicModel.empty(){
    examName = '';
    institute='';
    cgpa= 0.0;
    isCompleted =false;
    isPursuing =false;
    year=0;
  }

  AcademicModel.fromJson(Map<String, dynamic> json) {
    examName = json['exam_name'];
    institute = json['institute'];
    cgpa = json['cgpa']?.toDouble()??0.0;
    year = json['year']??0;
    isCompleted = json['is_completed'];
    isPursuing = json['is_pursuing'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_name'] = this.examName;
    data['institute'] = this.institute;
    data['cgpa'] = this.cgpa;
    data['year'] = this.year;
    data['is_completed'] = this.isCompleted;
    data['is_pursuing'] = this.isPursuing;
    return data;
  }
 // static List<AcademicModel> listFromJson(List<dynamic> json){
 //   List<AcademicModel> _list = [];
 //   json.forEach((element) {
 //     _list.add(AcademicModel.fromJson(element));
 //   });
 //   return _list;
 // }

 // static List<AcademicModel> listFromJson(List<dynamic> json){
 //   return  List.castFrom<dynamic,AcademicModel>(json.map((x)=> AcademicModel.fromJson(x)).toList());
 // }

}