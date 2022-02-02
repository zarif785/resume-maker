import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogueBox extends StatelessWidget {
  final VoidCallback? onYes,onNo;
  final String description;
 const DialogueBox({Key? key,this.onYes,
    this.onNo,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are You Sure?'),
      content: Text(description),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onNo,
            child: Text('No',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),
          ),
        ),
        SizedBox(width: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onYes,
            child: Text('Yes',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),),
          ),
        )
      ],
      elevation: 1.0,

    );
  }
}
Future<bool> showPromptDialog({required BuildContext context, required String description, String? title,required bool onConfirm}){
  Completer<bool> _completer = Completer();
  showDialog(
    context: context,
    builder: (BuildContext context) => DialogueBox(
      onYes: (){
        if(onConfirm==false) {
          Navigator.of(context).pop();
        }
        else{
          SystemNavigator.pop();
        }
        _completer.complete(true);
      },
      onNo: (){
        Navigator.of(context).pop();
        _completer.complete(false);
      }, description: description,
    ),
  );
  return _completer.future;
}
