

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/AccountsModel.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';

class Account extends StatefulWidget {

  // final FormContentModel model;
  final AccountsModel model;
  const Account( {Key? key, required this.model,}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with AppTheme, AutomaticKeepAliveClientMixin{

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController  = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();


  @override
  void initState() {
    usernameController.text = widget.model.name!;
    addressController.text = widget.model.address!;
    emailController.text = App.currentSession.email;
    mobileNoController.text = widget.model.contactNo!;

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
                children: [
                  TextFieldWidget(hintText: 'Name', type: 'name',initialValue:widget.model.name!,onTextChanged: (x){widget.model.name = x;}
                  ),
                  TextFieldWidget(hintText: 'Number', type: 'number',initialValue:widget.model.contactNo!,onTextChanged: (x){widget.model.contactNo = x;}),
                  TextFieldWidget(hintText: 'Email', type: 'email',initialValue:widget.model.email!,onTextChanged: (x){widget.model.email = x;}),
                  MultiLineTextFieldWidget(hintText: "Address", type: 'address',onTextChanged: (x){widget.model.address = x;},initialValue:widget.model.address!),
                  // CircularButton(onTap: onChange, icon: Icons.save),
                  // SizedBox(height: size.s24,),



                ],
              ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
