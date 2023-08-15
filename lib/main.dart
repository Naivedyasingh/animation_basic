// import 'package:animation_basic/animation_cross_frade.dart';
import 'package:flutter/material.dart';

import 'animation.dart';

void main(){
  runApp(MaterialApp(
    title: 'Animation',
    home:Scaffold(
      appBar: AppBar(
        title:const  Text('ani'),
      ),
      body: const AnimationScreen(),
    ) ,
  )
  );
}