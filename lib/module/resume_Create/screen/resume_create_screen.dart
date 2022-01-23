import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:resume_maker/common/core/app.dart';
import 'package:resume_maker/common/model/Academics.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/background.dart';
import 'package:resume_maker/common/widget/mutliline_textField.dart';
import 'package:resume_maker/common/widget/textField.dart';

class ResumeCreateScreen extends StatefulWidget {
  @override
  _ResumeCreateScreen createState() => _ResumeCreateScreen();
}

class _ResumeCreateScreen extends State<ResumeCreateScreen> with AppTheme{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RoundedAppBar(
        onBack: true,
        title: 'Create Resume',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearContainer(),
              UserCreds(),
              LinearContainer(),
              Academic(),

            ],
          ),
        )
      )

    );

  }


}
class LinearContainer extends StatelessWidget with AppTheme{
  const LinearContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.w),
      height: size.s42,
      width: 3.w,
      color: clr.appBlack,
    );
  }
}

class UserCreds extends StatefulWidget {
  const UserCreds({Key? key}) : super(key: key);

  @override
  _UserCredsState createState() => _UserCredsState();
}

class _UserCredsState extends State<UserCreds> with AppTheme{
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

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
                  child: _isShowing?Icon(Icons.check,color: Colors.white,):Icon(Icons.person,color: Colors.white,),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: size.s12),
                    padding: EdgeInsets.symmetric(vertical: size.s12,),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Text(
                        "Account",
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
                TextFieldWidget(hintText: 'Name', type: 'name', controller: usernameController,),
                TextFieldWidget(hintText: 'Number', type: 'number', controller: usernameController,),
                TextFieldWidget(hintText: 'Email', type: 'email', controller: usernameController,),
                MultiLineTextFieldWidget(controller: addressController, hintText: "Address", type: 'address'),

                SizedBox(height: size.s24,),

                 Row(
                      children: [
                  Container(
                      margin: EdgeInsets.only(bottom: size.s8,left: size.s4),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: clr.appBlack,
                    borderRadius: BorderRadius.circular(50.r),

                  ),
                 child:Icon(Icons.west,color: Colors.white,)
                ),

                Spacer(),
                        GestureDetector(
                          onTap: _toggleViewer,
                          child: Container(
                            margin: EdgeInsets.only(bottom: size.s8,right: size.s4),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: clr.appBlack,
                                borderRadius: BorderRadius.circular(50.r),

                              ),
                              child:Icon(Icons.east,color: Colors.white,)
                          ),
                        ),
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

class Academic extends StatefulWidget {
  const Academic({Key? key}) : super(key: key);

  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> with AppTheme{
  List<TextEditingController> _nameControllers = [];
  List<TextFieldWidget> _nameFields = [];
  List<TextEditingController> _telControllers = [];
  List<TextFieldWidget> _telFields = [];
  List<TextEditingController> _addressControllers = [];
  List<TextFieldWidget> _addressFields = [];
  bool addTapped =  false;




  void _addTile(String function) {

    final name = TextEditingController();
    final tel = TextEditingController();
    final address = TextEditingController();

    final nameField = TextFieldWidget(controller: name, type: 'name', hintText: 'Name',);
    final telField = TextFieldWidget(controller: tel, type: 'name', hintText: 'Phone',);
    final addressField = TextFieldWidget(controller: address, type: 'name', hintText: 'Address',);

        setState(() {
          if(function == "add") {
            _nameControllers.add(name);
            _telControllers.add(tel);
            _addressControllers.add(address);
            _nameFields.add(nameField);
            _telFields.add(telField);
            _addressFields.add(addressField);
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
    final children = [
      for (var i = 0; i < _nameControllers.length; i++)
        Container(

          child: Column(
            children: [
              _nameFields[i],
              _telFields[i],
              _addressFields[i],
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
                        "Academics",
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
             !addTapped? Text("Tap the ""+"" button to add your Academic accomplishments"):Offstage(),
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

