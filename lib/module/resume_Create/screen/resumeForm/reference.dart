import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';

class Reference extends StatefulWidget {
  const Reference({Key? key}) : super(key: key);

  @override
  _ReferenceState createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> with AppTheme{
  List<TextEditingController> _projectNameControllers = [];
  List<TextFieldWidget> _projectNameList = [];
  List<TextEditingController> _descriptionControllers = [];
  List<MultiLineTextFieldWidget> _descriptionList = [];
  List<TextEditingController> _roleContoller = [];
  List<TextFieldWidget> _roleList = [];
  List<TextEditingController> _linkListController = [];
  List<TextFieldWidget> _linkList = [];


  bool addTapped =  false;




  void _addTile(String function) {

    final projectName = TextEditingController();
    final description = TextEditingController();
    final role = TextEditingController();
    final links = TextEditingController();


    final projectNameField = TextFieldWidget(controller: projectName, type: 'degree', hintText: 'Project Name',);
    final descriptionField = MultiLineTextFieldWidget(controller:description, type: 'name', hintText: 'Description',);
    final roleField = TextFieldWidget(controller: role, type: 'number', hintText: 'Role',);
    final linkField = TextFieldWidget(controller: links, type: 'name', hintText: 'Link(if any)',);

    setState(() {
      if(function == "add") {
        _projectNameControllers.add(projectName);
        _descriptionControllers.add(description);
        _roleContoller.add(role);
        _linkListController.add(links);

        _projectNameList.add(projectNameField);
        _descriptionList.add(descriptionField);
        _roleList.add(roleField);
        _linkList.add(linkField);
        addTapped = true;
      }
      // else{
      //   _nameControllers.remove(name);
      //   _telControllers.remove(tel);
      //   _addressControllers.remove(address);
      //   _nameFields.remove(nameField);
      //   _telFields.remove(telField);
      //   _addressFields.remove(addressField);
      //   fieldCount--;
      // }

    });

  }




  Widget _listView() {
    int? _value = 0;
    bool active=false;
    final children = [
      for (var i = 0; i < _projectNameControllers.length; i++)
        Container(

          child: Column(
            children: [
              Text('${i+1}'),

              _projectNameList[i],
              _descriptionList[i],
              _roleList[i],
              _linkList[i],

              SizedBox(height: size.s20,)
            ],
          ),
        )
    ];
    return Container(
      child: Column(
        children: children,
      ),
    );
  }
  bool _isShowing= false;
  void _toggleViewer() {
    setState(() {
      _isShowing = !_isShowing;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleViewer,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: clr.appBlack,
                    borderRadius: BorderRadius.circular(50.r),

                  ),
                  child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.school,color: Colors.white,),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: size.s12),
                    padding: EdgeInsets.symmetric(vertical: size.s12,),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Text(
                        "Projects",
                        style: TextStyle(
                          // color:widget.service.currentChapterId == widget.chapter.id ?Colors.orange:Colors.black.withOpacity(.7),
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.s8),
                  child: Icon(_isShowing?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, size: 26, color: Colors.grey.withOpacity(.9),),
                ),
              ],

            ),
          ),
          _isShowing?Container(
            child: Column(
              children: [
                !addTapped? Text("Tap the ""+"" button to add your Projects",
                  style: TextStyle(color: clr.appBlack),
                ):Offstage(),
                SizedBox(height: size.s20,),
                _listView(),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [



                      GestureDetector(
                        onTap: ()=>_addTile('add'),
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

                      // GestureDetector(
                      //   onTap: ()=>_addTile('remove'),
                      //   child: Container(
                      //       margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
                      //       padding: EdgeInsets.all(8),
                      //       decoration: BoxDecoration(
                      //         color: clr.appBlack,
                      //         borderRadius: BorderRadius.circular(50.r),
                      //
                      //       ),
                      //       child:Icon(Icons.delete,color: Colors.white,)
                      //   ),
                      // ),
                    ]
                ),
              ],
            ),
          ):Offstage(),


          Container(
            height: 1.2,
            width: MediaQuery.of(context).size.width -100,
            color: Colors.grey.withOpacity(.25),
          ),

          // Divider(thickness: 3,indent: 30,endIndent: 30,)
        ],
      ),
    );
  }
}
