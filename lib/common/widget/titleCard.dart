// import 'package:flutter/material.dart';
// import 'package:resume_maker/common/theme/appTheme.dart';
// import 'package:resume_maker/common/utils/Toasty.dart';
//
// class TitleCardWidget extends StatefulWidget {
//   final  ValueChanged<String> onItemChanged;
//   const TitleCardWidget({Key? key, required this.onItemChanged}) : super(key: key);
//
//
//   @override
//   State<TitleCardWidget> createState() => _TitleCardWidgetState();
// }
//
// class _TitleCardWidgetState extends State<TitleCardWidget>  with AppTheme{
//   List<String> title = ['Account', 'Academic', 'Experience', 'Project', 'Reference', 'Image', 'Signature'];
//
//   void _onTap(){
//     Toasty.of(context).showWarning('Double Tap');
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children:title
//               .map((e) => GestureDetector(
//                 onTap: (){
//                   widget.onItemChanged(e);
//                 },
//                 child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       height: 45,
//                       width: 140,
//                       decoration: new BoxDecoration(
//                           color: clr.appBlack,
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Center(
//                         child: Text(
//                           e,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w800,
//                               color: clr.appWhite,
//                               fontSize: size.textXMedium),
//                         ),
//                       ),
//                     ),
//               ))
//               .toList(),
//         ));
//   }
// }
