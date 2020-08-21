import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorAnimation;
  Animation<double> _sizeAnimation;
  Animation _curve;
  bool isFav;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 320),
    );
    _curve =CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 30, end: 45), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 45, end: 30), weight: 50)
    ]).animate(_curve);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.redAccent)
        .animate(_curve);
    super.initState();

    _controller.addListener(() {
      // print(_controller.value);
      // print(_colorAnimation.value);
    });
    _controller.addStatusListener((status) {
     // print(status);
      status == AnimationStatus.completed ? isFav = true : isFav = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
            splashRadius: 0.25,
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              isFav == true ? _controller.reverse() : _controller.forward();
            });
      },
    );
  }
}
