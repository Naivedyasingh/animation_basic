import 'package:flutter/material.dart';

import 'animation.dart';

class AnimationCrossFadeScreen extends StatefulWidget {
  const AnimationCrossFadeScreen({super.key});
  @override
  State<AnimationCrossFadeScreen> createState() {
    return _AnimationCrossFadeState();
  }
}

class _AnimationCrossFadeState extends State<AnimationCrossFadeScreen> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = _crossFadeStateShowFirst ? false : true;
    });
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedCrossFade(
                  firstChild: Center(
                    child: Container(
                      color: Colors.blue.shade100,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  secondChild: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  crossFadeState: _crossFadeStateShowFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),

                ),
                Positioned.fill(child: FloatingActionButton(
                  onPressed: _crossFade,
                  child:const Text("Tap to\nfade color & size"),
                )),
               const  Divider(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
