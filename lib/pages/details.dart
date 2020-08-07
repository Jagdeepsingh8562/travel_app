import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/heart.dart';

class Details extends StatelessWidget {
  final Trip trip;
  Details({@required this.trip});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
              child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: trip.img,
                  child: Image.asset(
                  trip.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                title: Text(
                  trip.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[800]
                  )
                ),
                subtitle: Text(
                  '${trip.nights} night stay for only ₹${trip.price}',
                  style: TextStyle(letterSpacing: 1)
                ),
                trailing: HeartWidget()
              ),
                    Text(trip.para,style: TextStyle(color: Colors.grey[850],fontSize: 16),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
