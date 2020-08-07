import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(Icons.favorite,color: Colors.grey,), onPressed: (){});
  }
}