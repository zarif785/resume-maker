
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/date_input_field.dart';
import 'package:resume_maker/common/widget/textField.dart';

// class Academic extends StatefulWidget {
//   const Academic({Key? key}) : super(key: key);
//
//   @override
//   _AcademicState createState() => _AcademicState();
// }
//
// class _AcademicState extends State<Academic> with AppTheme{
//   List<TextEditingController> _degreeControllers = [];
//   List<TextFieldWidget> _degreeList = [];
//   List<TextEditingController> _instituteControllers = [];
//   List<TextFieldWidget> _instituteList = [];
//   List<TextEditingController> _cgpaContoller = [];
//   List<TextFieldWidget> _cgpaList = [];
//   List<DateInput> _passingYearList=[];
//
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
//
//
//     final degreeField = TextFieldWidget(controller: degree, type: 'degree', hintText: 'Exam Name',);
//     final instituteField = TextFieldWidget(controller:institute, type: 'name', hintText: 'Institute Name',);
//     final cgpaField = TextFieldWidget(controller: cgpa, type: 'number', hintText: 'CGPA',);
//     final passingYear = DateInput(hintText: "Passing Year",);
//
//     setState(() {
//       if(function == "add") {
//         _degreeControllers.add(degree);
//         _instituteControllers.add(institute);
//         _cgpaContoller.add(cgpa);
//
//         _degreeList.add(degreeField);
//         _instituteList.add(instituteField);
//         _cgpaList.add(cgpaField);
//         _passingYearList.add(passingYear);
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
//       for (var i = 0; i < _degreeControllers.length; i++)
//         Container(
//
//           child: Column(
//             children: [
//               Text('${i+1}'),
//
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
//                          _value= value;
//
//                       });
//                     },
//                   ),
//
//                   Text("Completed"),
//
//                   Radio(
//                     value:2,
//                     groupValue: _value ,
//                     onChanged: (int? value){
//                       setState(() {
//                         _value= value;
//                         active= true;
//                       });
//                     },
//                   ),
//
//                   Text("Pursuing"),
//                 ],
//               ),
//
//               active?DateInput(hintText:"XXX00"):Offstage(),
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
//                         "Academics",
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
//                 !addTapped? Text("Tap the ""+"" button to add your Academic accomplishments",
//                     style: TextStyle(color: clr.appBlack),
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
// enum DegreeStatus { completed, pursuing }

class Academic extends StatefulWidget {
  const Academic({Key? key}) : super(key: key);

  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> with AppTheme{
  int? _value =0;
  bool active = false;
  final degree = TextEditingController();
  final institute = TextEditingController();
  final cgpa = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(controller: degree, type: 'degree', hintText: 'Exam Name',),
        TextFieldWidget(controller:institute, type: 'name', hintText: 'Institute Name',),
        TextFieldWidget(controller: cgpa, type: 'number', hintText: 'CGPA',),

    Row(
                children: [
                  Radio(
                    value:1,
                    groupValue: _value ,
                    onChanged: (int? value){
                      setState(() {
                         _value= value;

                      });
                    },
                  ),

                  Text("Completed"),

                  Radio(
                    value:2,
                    groupValue: _value ,
                    onChanged: (int? value){
                      setState(() {
                        _value= value;
                        active= true;
                      });
                    },
                  ),

                  Text("Pursuing"),
                ],
              ),

        _value==1?DateInput(hintText:"Passing Year"):Offstage(),

        GestureDetector(
              onTap: ()=>null,
                child: Container(
                    margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: clr.appBlack,
                      borderRadius: BorderRadius.circular(50.r),

                    ),
                    child:Icon(Icons.add,color: Colors.white,)
                ),
              ),
  ],
    );
  }
}
