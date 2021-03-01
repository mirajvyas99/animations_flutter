import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage> {

  double _width = 200;
  double _height= 200;
  Color _color = Colors.redAccent;

  double _updateState(){
    setState(() {
      _width = 300;
      _height = 300;
      _color = Colors.lightGreenAccent[400];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                color: _color,
                child: Center(
                  child: Text(
                    "Animations",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Animate"),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: (){_updateState();},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
