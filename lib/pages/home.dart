import 'package:flutter/material.dart';
import 'package:travel_app/widgets/screenTitle.dart';
import 'package:travel_app/widgets/tripgrid.dart';
import 'package:travel_app/widgets/triplist.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isoll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 15, 20, 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"), 
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 150,child: ScreenTitle(text: 'Travel App')),
            Flexible(child: isoll == true ? TripList() : TripGrid())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(isoll==true? Icons.swap_vert:Icons.swap_horiz),onPressed: () {
        setState(() {
          isoll==true?isoll=false:isoll=true;
          print('object');
        });
      }),
    );
  }
}
