import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:resume_maker/common/model/FormContentModels.dart';
import 'package:resume_maker/common/model/ImageModel.dart';

import 'package:resume_maker/common/theme/appTheme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_maker/common/widget/circularButton.dart';

class UserImage extends StatefulWidget {
  final FormContentModel model;
  const UserImage({Key? key, required this.model}) : super(key: key);

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage>with AppTheme {

  File? imageFile;

  void initState() {
    imageFile = widget.model.imageModel.image;

    super.initState();

  }

  onChange(){
    widget.model.imageModel.image = imageFile;
  }

 Future  getImage(ImageSource source) async{
   Navigator.of(context).pop();
   final image = await ImagePicker().pickImage(source: source);
   setState(() {
     imageFile = File(image!.path);
   });

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
                  height: MediaQuery.of(context).size.height /3.5,
                  decoration: new BoxDecoration(

                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(25.0),
                          topRight: const Radius.circular(25.0))),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Take a picture or choose from your gallery",style: TextStyle(fontSize: size.textMedium),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()=> getImage(ImageSource.camera),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: clr.appBlack,
                                    width: 3.0,
                                  ),
                                  // color: Colors.orange,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera_alt,color: clr.appBlack,size: 40,),
                                    Text("Camera")
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 30),
                            GestureDetector(
                              onTap: ()=> getImage(ImageSource.gallery),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: clr.appBlack,
                                    width: 3.0,
                                  ),
                                  // color: Colors.orange,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.collections,color: clr.appBlack,size: 40,),
                                    Text("Gallery")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                )
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
            width: 120.0,
            height: 120.0,
            decoration: new BoxDecoration(
              border: Border.all(
                color: clr.appBlack,
                width: 5.0,
              ),
              // color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: imageFile== null?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 40,
                  color: clr.appBlack,
                ),
                Text(
                  'Add Image',style: TextStyle(color: Colors.grey,fontSize: size.textSmall,fontWeight: FontWeight.w600),
                )

              ],
            ):ClipOval(child: Image.file(imageFile!,fit: BoxFit.cover,)),

          ),
        ),
        // CircularButton(onTap: onChange, icon: Icons.save),
      ],
    );
  }
}
