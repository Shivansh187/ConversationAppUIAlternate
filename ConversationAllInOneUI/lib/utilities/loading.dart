import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
            Colors.deepPurple[900],
            Colors.deepPurple[800],
            Colors.indigo[800],
            Colors.indigo[900],
          ],
        ),
      ),
      child: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 50.0,
          lineWidth: 5.0,
        ),
      ),
    );
  }
}
