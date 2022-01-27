class UserSession {

  late String name;
  late String email;
  late String contactNo;
  late bool isActive;
  late String createdAt;
  late String updatedAt;
  late String accessToken;
  late String tokenType;

  UserSession.empty(){
    name = '';
    email='';
    contactNo='';
    isActive=false;
    createdAt = '';
    updatedAt = '';
    accessToken = '';
    tokenType = 'bearer';

  }

  UserSession.fromJson(Map<String, dynamic> json) {

    name = json['name']??"";
    email = json['email']??"";
    contactNo = json['contact_no']??"";
    isActive = json['is_active']??false;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    accessToken = json['accessToken']??"";
    tokenType = json['tokenType']??"bearer";


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact_no'] = this.contactNo;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['accessToken']= this.accessToken;
    data['tokenType'] = this.tokenType;
    return data;
  }
}