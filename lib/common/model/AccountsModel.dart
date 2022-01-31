class AccountsModel{

  late String name;
  late String email;
  late String contactNo;
  late String address;


  AccountsModel.empty(){
    name = '';
    email='';
    contactNo='';
    address ='';
  }

  AccountsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    contactNo = json['contact_no'] ?? "";
    address = json['address']?? "";
  }
}