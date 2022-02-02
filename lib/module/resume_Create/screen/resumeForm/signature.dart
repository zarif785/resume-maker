import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/SignatureModel.dart';
import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:resume_maker/common/widget/circularButton.dart';
import 'package:signature/signature.dart';

class SignatureSection extends StatefulWidget {
  final FormContentModel model;
  const SignatureSection({Key? key, required this.model}) : super(key: key);

  @override
  _SignatureSectionState createState() => _SignatureSectionState();
}

class _SignatureSectionState extends State<SignatureSection> with AppTheme{
  late SignatureController controller;

  Uint8List? _signatureImage;


  onChange(){
    widget.model.signatureModel.signature =  _signatureImage;
    ;
  }

  @override
  void initState() {

    super.initState();
    controller = SignatureController(
      penColor: Colors.black
    );
    _signatureImage = widget.model.signatureModel.signature;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void bottomSheet() {
    showModalBottomSheet(
        backgroundColor: clr.appWhite,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )),
        builder: (builder) {

          return Wrap(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height /3 ,
                  decoration: new BoxDecoration(

                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                            Signature(
                              controller: controller,
                              backgroundColor: clr.appBlack,
                              height: 200,
                              width: 500,
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildCheck(context),

                                buildClear(),
                              ],
                            )


                          ],
                        )

                    ),
                  ),

              ]
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: bottomSheet,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 300.0,
            height: 100.0,
            decoration: new BoxDecoration(
              border: Border.all(
                color: clr.appBlack,
                width: 5.0,
              ),
              // color: Colors.orange,
              shape: BoxShape.rectangle,
            ),
            child:_signatureImage != null ? Image.memory(_signatureImage!):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 40,
                  color: clr.appBlack,
                ),
                Text(
                  'Add Signature',style: TextStyle(color: Colors.grey,fontSize: size.textSmall,fontWeight: FontWeight.w600),
                )
              ],
            )
          ),
        ),
        // CircularButton(onTap: onChange, icon: Icons.save),
      ],

    );;
  }

  Widget buildCheck(BuildContext context) => IconButton(
    iconSize: 36,
    icon: Icon(Icons.check,color: Colors.green,), onPressed: () async
  {
    controller.toPngBytes().then((value){
      if(mounted){
        setState(() {
          _signatureImage = value;
        });
      }
    });
    Navigator.pop(context);
  },
  );

  Widget buildClear() => IconButton(
    iconSize: 36,
    icon: Icon(Icons.clear,color: Colors.red,), onPressed: () { controller.clear();  },
  );
}
