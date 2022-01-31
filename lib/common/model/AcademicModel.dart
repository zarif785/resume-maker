class AcademicModel{
  late String examName;
  late String instituteName;
  late double cgpa;
  late bool completed;
  late String passingYear;

  AcademicModel.empty(){
    examName = '';
    instituteName='';
    cgpa=0.0;
    completed =false;
    passingYear='';
  }

}