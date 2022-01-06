import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget {
  final String title;
  final Widget child;
  const RoundedAppBar({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          title,
        ),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
