import 'package:animations_flutter/sandbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animate.dart';
import 'screens/home.dart';
import 'tween_animate.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AnimatePage(),
      // home: TweenAnimatePage(),
      // home: Sandbox(),
      home: Home(),
      // Scaffold(
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text("Animation Pages",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
      //         SizedBox(height: 40,),
      //         RaisedButton(
      //           child: Text("Normal Animate"),
      //           color: Colors.black,
      //           textColor: Colors.white,
      //           onPressed: (){
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => AnimatePage(),
      //             ));
      //           },
      //         ),
      //         RaisedButton(
      //           child: Text("Tween Animate"),
      //           color: Colors.black,
      //           textColor: Colors.white,
      //           onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) => TweenAnimatePage(),
      //             ));
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

