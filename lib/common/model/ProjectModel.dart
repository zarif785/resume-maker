class ProjectListModel {
  late List<ProjectModel> projectData;

  ProjectListModel.empty(){
    projectData = [];
  }

  ProjectListModel.fromJson(Map<String, dynamic> json) {
    projectData = <ProjectModel>[];
    if (json['project_data'] != null) {

      json['project_data'].forEach((v) {
        projectData.add(new ProjectModel.fromJson(v));
      });
    }
  }

  ProjectListModel.fromJsonList(List<dynamic>? json) {
    projectData = <ProjectModel>[];
    if (json != null) {
      json.forEach((v) {
        projectData.add(ProjectModel.fromJson(v)) ;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

      data['project_data'] = this.projectData.map((v) => v.toJson()).toList();

    return data;
  }
}


class ProjectModel{
  late int id;
  late String projectName;
  late String description;
  late String role;
  late String link;

  ProjectModel.empty(){
    id = 0;
    projectName = '';
    description='';
    role='';
    link ='';
  }

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    projectName = json['project_name']??'';
    description = json['description']??'';
    role = json['responsibility']??'';
    link = json['project_link']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    data['description'] = this.description;
    data['responsibility'] = this.role;
    data['project_link'] = this.link;
    return data;
  }
}