import 'package:animation_basic/Animation_controller.dart';
import 'package:animation_basic/animation_cross_frade.dart';
import 'package:animation_basic/opacity.dart';
import 'package:flutter/material.dart';

double _height = 100;
double _width = 100;

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() {
    return _AnimationScreenState();
  }
}

class _AnimationScreenState extends State<AnimationScreen> {
  void _increaseWidth() {
    setState(() {
      _width = _width >= 320 ? 100 : _width += 50;
    });
  }

  void _increaseHeight() {
    setState(() {
      _height = _height >= 320 ? 100 : _height += 50;
    });
  }

  void _setAt(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AnimationCrossFadeScreen(),
      ),
    ); 
  }

  @override
  Widget build(context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Center(
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              color: Colors.amber,
              height: _height,
              width: _width,
              child: FloatingActionButton(
                onPressed: _increaseWidth,
                child: const Text("animation practice width"),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              color: Colors.amber,
              height: _height,
              width: _width,
              child: FloatingActionButton(
                onPressed: (){
                  _setAt(context);
                },
                child: const Text("animation practice height "),
              ),
            ),
            const Divider(
              height: 10,
            ),
            const AnimationCrossFadeScreen(),
            const Divider(height: 10),
            const OpacityScreen(),
            const AnimationControllerScreen(),
          ],
        ),
      ),
    ));
  }
}
