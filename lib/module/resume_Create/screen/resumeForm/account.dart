// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:resume_maker/common/theme/appTheme.dart';
// import 'package:resume_maker/common/widget/mutliline_textField.dart';
// import 'package:resume_maker/common/widget/textField.dart';
//
// class UserCreds extends StatefulWidget {
//   const UserCreds({Key? key}) : super(key: key);
//
//   @override
//   _UserCredsState createState() => _UserCredsState();
// }
//
// class _UserCredsState extends State<UserCreds> with AppTheme{
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//
//   bool _isShowing= false;
//   void _toggleViewer() {
//     setState(() {
//       _isShowing = !_isShowing;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 2.w),
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: _toggleViewer,
//             child: Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                     color: clr.appBlack,
//                     borderRadius: BorderRadius.circular(50.r),
//
//                   ),
//                   child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.person,color: Colors.white,),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(left: size.s12),
//                     padding: EdgeInsets.symmetric(vertical: size.s12,),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal:16.0),
//                       child: Text(
//                         "Account",
//                         style: TextStyle(
//                           // color:widget.service.currentChapterId == widget.chapter.id ?Colors.orange:Colors.black.withOpacity(.7),
//                           fontSize: 19,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(size.s8),
//                   child: Icon(_isShowing?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, size: 26, color: Colors.grey.withOpacity(.9),),
//                 ),
//               ],
//
//             ),
//           ),
//           _isShowing?Container(
//             child: Column(
//               children: [
//                 TextFieldWidget(hintText: 'Name', type: 'name', controller: usernameController,),
//                 TextFieldWidget(hintText: 'Number', type: 'number', controller: usernameController,),
//                 TextFieldWidget(hintText: 'Email', type: 'email', controller: usernameController,),
//                 MultiLineTextFieldWidget(controller: addressController, hintText: "Address", type: 'address'),
//
//                 SizedBox(height: size.s24,),
//
//                 Row(
//                     children: [
//                       Container(
//                           margin: EdgeInsets.only(bottom: size.s8,left: size.s4),
//                           padding: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: clr.appBlack,
//                             borderRadius: BorderRadius.circular(50.r),
//
//                           ),
//                           child:Icon(Icons.west,color: Colors.white,)
//                       ),
//
//                       Spacer(),
//                       GestureDetector(
//                         onTap: _toggleViewer,
//                         child: Container(
//                             margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: clr.appBlack,
//                               borderRadius: BorderRadius.circular(50.r),
//
//                             ),
//                             child:Icon(Icons.east,color: Colors.white,)
//                         ),
//                       ),
//                     ]
//                 ),
//
//               ],
//             ),
//           ):Offstage(),
//           Container(
//             height: 1.2,
//             width: MediaQuery.of(context).size.width -100,
//             color: Colors.grey.withOpacity(.25),
//           ),
//
//           // Divider(thickness: 3,indent: 30,endIndent: 30,)
//         ],
//       ),
//     );
//   }
// }
//
// enum DegreeStatus { completed, pursuing }

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
  final TextEditingController usernameController;
  final TextEditingController addressController ;
  final TextEditingController emailController ;
  final TextEditingController mobileNoController;
  // final FormContentModel model;
  final AccountsModel model;
  const Account( {Key? key, required this.model, required this.usernameController, required this.addressController, required this.emailController, required this.mobileNoController}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with AppTheme, AutomaticKeepAliveClientMixin{


  @override
  void initState() {
    widget.usernameController.text = widget.model.name!;
    widget.addressController.text = widget.model.address!;
    widget.emailController.text = App.currentSession.email;
    widget.mobileNoController.text = widget.model.contactNo!;
    // usernameController.text = widget.model.accountsModel.name;
    // addressController.text = widget.model.accountsModel.address;
    // emailController.text = widget.model.accountsModel.email;
    // mobileNoController.text = widget.model.accountsModel.contactNo;

    super.initState();

  }

  onChange(){
    // widget.model.accountsModel.name = usernameController.text;
    // widget.model.accountsModel.contactNo = mobileNoController.text;
    // widget.model.accountsModel.address = addressController.text;
    // widget.model.accountsModel.email = emailController.text;
    widget.model.name = widget.usernameController.text;
    widget.model.contactNo = widget.mobileNoController.text;
    widget.model.address = widget.addressController.text;
    widget.model.email = widget.emailController.text;
  }
  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Container(
      child: Column(
                children: [
                  TextFieldWidget(hintText: 'Name', type: 'name', controller: widget.usernameController,
                  ),
                  TextFieldWidget(hintText: 'Number', type: 'number', controller: widget.mobileNoController,),
                  TextFieldWidget(hintText: 'Email', type: 'email', controller: widget.emailController,),
                  MultiLineTextFieldWidget(controller: widget.addressController, hintText: "Address", type: 'address'),
                  // CircularButton(onTap: onChange, icon: Icons.save),
                  // SizedBox(height: size.s24,),



                ],
              ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
