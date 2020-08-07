import 'package:flutter/material.dart';
import 'package:travel_app/widgets/tripgrid.dart';
import 'package:travel_app/widgets/triplist.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isoll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 58,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 75),
            Flexible(child: isoll == true ? TripList() : TripGrid()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(isoll==true? Icons.swap_vert:Icons.swap_horiz),onPressed: () {
        setState(() {
          if (isoll == false) {
            isoll = true;
          } else
            isoll = false;
        });
      }),
    );
  }
}
