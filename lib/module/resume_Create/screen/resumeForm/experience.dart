// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:resume_maker/common/theme/appTheme.dart';
// import 'package:resume_maker/common/widget/mutliline_textField.dart';
// import 'package:resume_maker/common/widget/textField.dart';
//
// class Experience extends StatefulWidget {
//   const Experience({Key? key}) : super(key: key);
//
//   @override
//   _ExperienceState createState() => _ExperienceState();
// }
//
// class _ExperienceState extends State<Experience> with AppTheme{
//   List<TextEditingController> _degreeControllers = [];
//   List<TextFieldWidget> _degreeList = [];
//   List<TextEditingController> _instituteControllers = [];
//   List<TextFieldWidget> _instituteList = [];
//   List<TextEditingController> _cgpaContoller = [];
//   List<TextFieldWidget> _cgpaList = [];
//   List<TextEditingController> _passingYearContoller = [];
//   List<TextFieldWidget> _passingYearList = [];
//   bool addTapped =  false;
//
//
//
//
//   void _addTile(String function) {
//
//     final degree = TextEditingController();
//     final institute = TextEditingController();
//     final cgpa = TextEditingController();
//     final passing_year = TextEditingController();
//
//     final degreeField = TextFieldWidget(controller: degree, type: 'degree', hintText: 'Organization',);
//     final instituteField = TextFieldWidget(controller:institute, type: 'name', hintText: 'Designation',);
//     final cgpaField = TextFieldWidget(controller: cgpa, type: 'number', hintText: 'From(Duration)',);
//     final passingYearField = TextFieldWidget(controller: passing_year, type: 'number', hintText: 'From(Duration)',);
//
//     setState(() {
//       if(function == "add") {
//         _degreeControllers.add(degree);
//         _instituteControllers.add(institute);
//         _cgpaContoller.add(cgpa);
//         _passingYearContoller.add(passing_year);
//         _degreeList.add(degreeField);
//         _instituteList.add(instituteField);
//         _cgpaList.add(cgpaField);
//         _passingYearList.add(passingYearField);
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
//
//
//     final children = [
//
//       for (var i = 0; i < _degreeControllers.length; i++)
//         Container(
//           child: Column(
//             children: [
//               Text('${i+1}'),
//               _degreeList[i],
//               _instituteList[i],
//               _cgpaList[i],
//               Row(
//                 children: [
//                   Radio(
//                     value:1,
//                     groupValue: _value ,
//                     onChanged: (int? value){
//                       setState(() {
//                         _value= value;
//                         _passingYearContoller[i].text= "Currently Employed";
//                       });
//                     },
//                   ),
//
//                   Text("Currently Employed"),
//
//                   Radio(
//                     value:1,
//                     groupValue: _value ,
//                     onChanged: (int? value){
//                       setState(() {
//                         _value= value;
//                         _passingYearContoller[i].text= "Previously Employed";
//                       });
//                     },
//                   ),
//
//                   Text("Previously Employed"),
//                 ],
//               ),
//
//               _passingYearList[i],
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
//                   child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.work,color: Colors.white,),
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(left: size.s12),
//                     padding: EdgeInsets.symmetric(vertical: size.s12,),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal:16.0),
//                       child: Text(
//                         "Experience",
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
//                 !addTapped? Text("Tap the ""+"" button to add your Work Experience",
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
//

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/date_input_field.dart';
import 'package:resume_maker/common/widget/textField.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> with AppTheme{
    final organization = TextEditingController();
    final designation = TextEditingController();
    int _value= 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

    TextFieldWidget(controller: organization, type: 'degree', hintText: 'Organization',),
    TextFieldWidget(controller:designation, type: 'name', hintText: 'Designation',),
    DateInput(hintText: "From(Duration)"),



                SizedBox(height: size.s20,),
        Row(
          children: [
            Radio(
              value:1,
              groupValue: _value ,
              onChanged: (int? value){
                setState(() {
                  _value= value!;

                });
              },
            ),

            Text("Left Job"),

            Radio(
              value:2,
              groupValue: _value ,
              onChanged: (int? value){
                setState(() {
                  _value= value!;

                });
              },
            ),

            Text("Still Active"),
          ],
        ),

        _value==1?DateInput(hintText: "To(Duration"):Offstage(),

              ],
            );
  }
}
