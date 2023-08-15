import 'package:flutter/material.dart';
import 'package:animation_basic/animation.dart';

class OpacityScreen extends StatefulWidget{
  const OpacityScreen({super.key});

  @override
  State<OpacityScreen> createState(){
    return _OpacityScreenState();
  }
}class _OpacityScreenState extends State<OpacityScreen>{
  double _opacity=1;
  void animatedOpacity(){
    setState(() {
      _opacity=_opacity==1?0.3:1;
    });
  }
  @override
  Widget build(context){
    return Row(
      children: <Widget>[
        AnimatedOpacity(opacity: _opacity, duration:const Duration(milliseconds: 500),
        child: Container(
          color: Colors.grey,
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: animatedOpacity,
            child:const Text('Tap to opacity'),
          ),
        ),),
      ],
    );
  }
}
