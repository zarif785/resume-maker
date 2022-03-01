import 'dart:io';

class ImageModel{
  late File profileImage;

  ImageModel.empty(){
    profileImage = File("");
  }

  ImageModel.fromJson(Map<String, dynamic> json){
    profileImage = json['profile_image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    return data;
  }
}

