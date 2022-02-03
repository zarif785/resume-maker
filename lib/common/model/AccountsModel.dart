class AccountsModel{

   String? name;
   String? email;
   String? contactNo;
   String? address;


  AccountsModel.empty(){
    name = '';
    email='';
    contactNo='';
    address ='';
  }
  AccountsModel.fromJson(Map<String, dynamic> json) {
    name = json['name']??"";
    contactNo = json['contact_no']??"";
    address = json['address']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['contact_no'] = this.contactNo;
    data['address'] = this.address;
    return data;
  }
}