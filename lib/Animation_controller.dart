import 'package:flutter/material.dart';

class AnimationControllerScreen extends StatefulWidget{
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState(){
    return _AnimationControllerState();
  }
}

class _AnimationControllerState extends State<AnimationControllerScreen>with TickerProviderStateMixin {
  late AnimationController _controllerGrowSize;
  late Animation<double> _animationFloatUp;
  late AnimationController _controllerFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp = AnimationController(duration: Duration(seconds: 4),
        vsync: this);
    _controllerGrowSize = AnimationController(duration: Duration(seconds: 2),
        vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery
        .of(context)
        .size
        .height / 3;
    double _balloonBottomLocation = MediaQuery
        .of(context)
        .size
        .height -
        _balloonHeight;
    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).
    animate(CurvedAnimation(
        parent: _controllerFloatUp, curve: Curves.slowMiddle));
    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).
    animate(CurvedAnimation(
        parent: _controllerGrowSize, curve: Curves.elasticInOut));
    _controllerFloatUp.forward();
    _controllerGrowSize.forward();
    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          }
          else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
          }
        },
        child: Image.asset(
            'images/food.jpg',
            height: _balloonHeight,
            width: _balloonWidth),
      ),
    );
  }
}