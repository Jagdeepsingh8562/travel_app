import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/pages/details.dart';

class TripGrid extends StatefulWidget {
  @override
  _TripGridState createState() => _TripGridState();
}

class _TripGridState extends State<TripGrid> {
  List<Widget> tripTiles = [];
  final GlobalKey _listKeo = GlobalKey();

  @override
  void initState() {
    super.initState();
    addTrips();
  }

  void addTrips() {
    List<Trip> trips = [
      Trip(
          title: 'Paris,France',
          nights: '5',
          img: 'assets/PARIS.jpg',
          price: '39,193',
          para:
              'Bonjour Mon Ami! Paris needs no formal introduction - synonymous with culture, architecture, food and fashion. That je ne sais quoi of the French capital makes it the dream destination for many. So would you want to leave Paris '
              'Before Sunset'
              ' or would you take our word and spend a '
              'Midnight in Paris'
              '?! The mesmerizing wrought-iron spire of the Eiffel Tower piercing the skyline, the Arc de Triomphe guarding the most glamorous avenue, the Champs Elysees, the regal Notre Dame cathedral, lamp lit bridges spanning the Seine and art nouveau cafes spilling onto wicker-chair-lined terraces.'),
      Trip(
          title: 'London,England',
          nights: '4',
          img: 'assets/LONDON.jpg',
          price: '27,993',
          para:
              'Standing on the Thames River, London is the capital of England as well as the most populous city in Great Britain. The city is a confluence of the old and the new and is one of the top tourist destinations in the world. It is a city with numerous attractions of all sorts including great architecture and heritage. London is made of two ancient cities which are now merged together to form the capital. The two cities are The city of London and the City of Westminster. Together, they are known as Greater London. London attracts over 15.3 million international tourists in a year. The numerous attractions in the city like the London Eye, Big Ben, Houses of Parliament, Westminster'
              's Abbey and Nelson'
              's Column attract a large number of visitors.'),
      Trip(
          title: 'New Zealand',
          nights: '3',
          img: 'assets/NEW-ZEALAND.jpg',
          price: '30,365',
          para:
              'New Zealand lies in the Pacific Ocean, to the southwest. New Zealand promises beautiful landscapes and serene, equally beautiful coastlines that you can drive along, listening to the sound of the surf. The country is also known for its adventure sports activities as well as its museums, art galleries and other heritage attractions.'),
      Trip(
          title: 'Iceland',
          nights: '4',
          img: 'assets/ICELAND.jpg',
          price: '33,765',
          para:
              'Amongst the most coveted travel destinations, Iceland is one of the most surreal and magnificent countries in the world. Located close to the Arctic Circle, it offers amazingly dramatic and breath-taking landscapes and exotic natural phenomena. Summer is the best time to visit, owing to the mild temperatures and a plethora of available activities from hiking fjords to playing golf at midnight. However, no time is a bad time to visit this spectacular snow-covered country.'),
      Trip(
          title: 'Bali, Indonesia',
          nights: '5',
          img: 'assets/BALI.jpg',
          price: '27,045',
          para:
              "Indonesia's most famous island, Bali is the best place for any tourist who needs a week of absolute relaxation, fragrant cuisine, scenic beauty and a galore of culture and tradition. With its elaborate temples, endless coastline, scenic coral reefs, waterfalls and retreats, Bali is indeed, a place of leisure and idyll, and simultaneously, a place for the adventurous and the explorers. The island boasts some of the best sunsets and sunrises, enough to captivate and entice you into never leaving this tourist trap. Home to many coral reefs, mountain peaks, beaches and scenic routes, with old temples and small snatches of Balinese old-world-charm in the streets and groves. It also has its own cultural roots, its own cuisine, festivals, music and native art, which is a sight to behold."),
      Trip(
          title: ' The Grand Canyon',
          nights: '4',
          img: 'assets/The_Grand_Canyon.jpg',
          price: '37,045',
          para:
              "Yellowstone's Grand Canyon is one of the most iconic sites in the region, providing several stunning vistas as you go along. This almost 40 km long canyon is a large and the most famous canyon in Yellowstone. It is hugely popular among visitors due to its scenic views of the Lower and Upper falls, as well as the fascinating pink and yellow coloured rocks. There are several viewpoints and points of interest along the length of the canyon. The canyon's beautiful shades of colours are an iconic part of Yellowstone. The mineral stains due to the activities of water have given the rocks of the canyon such a pleasant tint of colours, it is truly a sight to behold. The geology of the canyon is not completely clear. It was created due to erosion over hundreds of thousands of years, and the geothermal nature of the area is still prevalent, which can be seen by the hot springs throughout the canyon."),
    ];
    trips.forEach((Trip trip) {
      tripTiles.add(_buildTile(trip));
    });
  }

  Widget _buildTile(Trip trip) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => Details(trip: trip))),
      child: Container(
        child: Card(color: Color.fromARGB(230, 255, 255, 255),
            child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                    tag: '${trip.img}',
                    child: Image.asset(
                      trip.img,
                      height: 100,
                    )),
              ),
              Text(trip.title,
                style: TextStyle(fontSize: 20, color: Colors.grey[600])),
            Text('${trip.nights} nights',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[300])),
              SizedBox(height: 10,),Text('₹${trip.price}'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        key: _listKeo,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return tripTiles[index];
        },itemCount: tripTiles.length,
        );
    // return ListView.builder(
    //   key: _listKey,
    //   itemCount: tripTiles.length,
    //   itemBuilder: (context, index) {
    //     return tripTiles[index];
    //   }
    //);
  }
}
