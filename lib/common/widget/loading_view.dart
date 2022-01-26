//
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class LoadingView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SpinKitChasingDots(
//         color: Colors.blue.withOpacity(.3),
//         size: 44,
//       ),
//     );
//   }
// }
class LoadingView extends StatelessWidget {

  final double size;
  const LoadingView({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPianoWave(
        color: Colors.white,
        size: size,
      ),
    );
  }
}
