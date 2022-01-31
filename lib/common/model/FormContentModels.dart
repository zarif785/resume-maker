import 'package:resume_maker/common/model/AcademicModel.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/ExperienceModel.dart';
import 'package:resume_maker/common/model/ImageModel.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/model/ReferenceModel.dart';
import 'package:resume_maker/common/model/SignatureModel.dart';
import 'package:resume_maker/module/resume_Create/screen/resumeForm/experience.dart';

class FormContentModel{
  late AccountsModel accountsModel;
  late AcademicModel academicModel;
  late ExperienceModel experienceModel;
  late ProjectModel projectModel;
  late ReferenceModel referenceModel;
  late ImageModel imageModel;
  late SignatureModel signatureModel;

  FormContentModel(){
    accountsModel = AccountsModel.empty();
    academicModel = AcademicModel.empty();
    experienceModel = ExperienceModel.empty();
    projectModel = ProjectModel.empty();
    referenceModel = ReferenceModel.empty();
    imageModel = ImageModel.empty();
    signatureModel = SignatureModel.empty();
  }


}


