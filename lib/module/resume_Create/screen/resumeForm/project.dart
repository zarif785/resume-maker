import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ProjectModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:resume_maker/common/widget/date_input_field.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';

// class Project extends StatefulWidget {
//   const Project({Key? key}) : super(key: key);
//
//   @override
//   _ProjectState createState() => _ProjectState();
// }
//
// class _ProjectState extends State<Project> with AppTheme{
//   List<TextEditingController> _nameControllers = [];
//   List<TextFieldWidget> _nameList = [];
//   List<TextEditingController> _designationControllers = [];
//   List<TextFieldWidget> _designationList = [];
//   List<TextEditingController> _instituteContoller = [];
//   List<TextFieldWidget> _instituteList = [];
//   List<TextEditingController> _emailController = [];
//   List<TextFieldWidget> _emailList = [];
//   List<TextEditingController> _mobileController = [];
//   List<TextFieldWidget> _mobileList = [];
//
//
//   bool addTapped =  false;
//
//
//
//
//   void _addTile(String function) {
//
//     final name = TextEditingController();
//     final designation = TextEditingController();
//     final institute = TextEditingController();
//     final email = TextEditingController();
//     final mobile_no = TextEditingController();
//
//
//     final nameField = TextFieldWidget(controller: name, type: 'degree', hintText: 'Name',);
//     final designationField = TextFieldWidget(controller:designation, type: 'name', hintText: 'Designation',);
//     final instituteField = TextFieldWidget(controller: institute, type: 'number', hintText: 'Institute',);
//     final emailField = TextFieldWidget(controller: email, type: 'name', hintText: 'Email',);
//     final mobile_noField = TextFieldWidget(controller: mobile_no, type: 'name', hintText: 'Mobile Number',);
//
//     setState(() {
//       if(function == "add") {
//         _nameControllers.add(name);
//         _designationControllers.add(designation);
//         _instituteContoller.add(institute);
//         _emailController.add(email);
//         _mobileController.add(mobile_no);
//
//         _nameList.add(nameField);
//         _designationList.add(designationField);
//         _instituteList.add(instituteField);
//         _emailList.add(emailField);
//         _mobileList.add(mobile_noField);
//         addTapped = true;
//       }
//       // else{
//       //   _nameControllers.remove(name);
//       //   _telControllers.remove(tel);
//       //   _addressControllers.remove(address);
//       //   _nameFields.remove(nameField);
//       //   _telFields.remove(telField);
//       //   _addressFields.remove(addressField);
//       //   fieldCount--;
//       // }
//
//     });
//
//   }
//
//
//
//
//   Widget _listView() {
//     int? _value = 0;
//     bool active=false;
//     final children = [
//       for (var i = 0; i < _nameControllers.length; i++)
//         Container(
//
//           child: Column(
//             children: [
//               Text('${i+1}'),
//
//               _nameList[i],
//               _designationList[i],
//               _instituteList[i],
//               _emailList[i],
//               _mobileList[i],
//
//
//               SizedBox(height: size.s20,)
//             ],
//           ),
//         )
//     ];
//     return Container(
//       child: Column(
//         children: children,
//       ),
//     );
//   }
//   bool _isShowing= false;
//   void _toggleViewer() {
//     setState(() {
//       _isShowing = !_isShowing;
//     });
//   }
//
//
//
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
//                   child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.school,color: Colors.white,),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(left: size.s12),
//                     padding: EdgeInsets.symmetric(vertical: size.s12,),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal:16.0),
//                       child: Text(
//                         "Reference",
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
//                 !addTapped? Text("Tap the ""+"" button to add your Projects",
//                   style: TextStyle(color: clr.appBlack),
//                 ):Offstage(),
//                 SizedBox(height: size.s20,),
//                 _listView(),
//
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//
//
//
//                       GestureDetector(
//                         onTap: ()=>_addTile('add'),
//                         child: Container(
//                             margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: clr.appBlack,
//                               borderRadius: BorderRadius.circular(50.r),
//
//                             ),
//                             child:Icon(Icons.add,color: Colors.white,)
//                         ),
//                       ),
//
//                       // GestureDetector(
//                       //   onTap: ()=>_addTile('remove'),
//                       //   child: Container(
//                       //       margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
//                       //       padding: EdgeInsets.all(8),
//                       //       decoration: BoxDecoration(
//                       //         color: clr.appBlack,
//                       //         borderRadius: BorderRadius.circular(50.r),
//                       //
//                       //       ),
//                       //       child:Icon(Icons.delete,color: Colors.white,)
//                       //   ),
//                       // ),
//                     ]
//                 ),
//               ],
//             ),
//           ):Offstage(),
//
//
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

class Project extends StatefulWidget {
  final FormContentModel model;
  const Project({Key? key, required this.model}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> with AppTheme{
  final projectName = TextEditingController();
  final description = TextEditingController();
  final role = TextEditingController();
  final links = TextEditingController();

  @override
  void initState() {
    projectName.text = widget.model.projectModel.projectName;
    description.text = widget.model.projectModel.description;
    role.text = widget.model.projectModel.role;
    links.text = widget.model.projectModel.link;

    super.initState();

  }

  onChange(){
    widget.model.projectModel.projectName = projectName.text;
    widget.model.projectModel.description = description.text;
    widget.model.projectModel.role = role.text;
    widget.model.projectModel.link = links.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      TextFieldWidget(controller: projectName, type: 'degree', hintText: 'Project Name',),
      MultiLineTextFieldWidget(controller:description, type: 'name', hintText: 'Description',),
      TextFieldWidget(controller: role, type: 'number', hintText: 'Role',),
      TextFieldWidget(controller: links, type: 'name', hintText: 'Link(if any)',),
        // CircularButton(onTap: onChange, icon: Icons.save),
        // SizedBox(height: size.s20,),


      ],

    );
  }
}

