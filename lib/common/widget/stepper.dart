import 'package:flutter/material.dart';
import 'package:resume_maker/module/resume_Create/screen/resume_create_screen.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
        width: 20.0,
        height: 20.0,
    decoration: new BoxDecoration(
    color: Colors.orange,
    shape: BoxShape.circle,
    ),
    ),

      ],
    );
  }
}
