import 'package:flutter/material.dart';

class TweenAnimatePage extends StatefulWidget {
  @override
  _TweenAnimatePageState createState() => _TweenAnimatePageState();
}

class _TweenAnimatePageState extends State<TweenAnimatePage> with TickerProviderStateMixin{

  Tween<double> _scaleTween = Tween <double>(begin: 0,end: 1);

  AnimationController _iconAnimationController;
  AnimationController _colorAnimationController;
  Animation _iconColorAnimation;
  Animation _backgroundColorAnimation;
  bool _active = false;

  @override
  void initState(){
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.75,
    );

    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 125),
    );

    _backgroundColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_colorAnimationController)..addListener(() {
      setState(() {});
    });

    _iconColorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.green,
    ).animate(_colorAnimationController)..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _onTap(){
   _iconAnimationController.forward().then((value){
     _active
         ? _colorAnimationController.forward()
         : _colorAnimationController.reverse();
     _iconAnimationController.reverse();
   });
   _active = !_active;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder(
              tween: _scaleTween,
              duration: Duration(milliseconds: 600),
              builder: (context,scale,child){
                return Transform.scale(scale: scale,child: child);
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: _onTap,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.black),
                  color: _backgroundColorAnimation.value,
                ),
                child: ScaleTransition(
                  scale: _iconAnimationController,
                  child: Icon(
                    Icons.android_outlined,
                    size: 40,
                    color: _iconColorAnimation.value,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
