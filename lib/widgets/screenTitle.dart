import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TweenAnimationBuilder(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            ),
      ),     
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500),
      builder: (BuildContext context, double _val, Widget child){
       
        return Opacity(
            opacity: _val,
            child:Padding(
              padding: EdgeInsets.only(top: _val * 25),
              child: child,
            ));
      }, onEnd: () => print('hellio'),
    );
  }
}