import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'home_widget.dart';
import 'placeholder_widget.dart';
import 'products.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<Map<String, double>> _locationSubscription;
  Location _location = new Location();
  bool _permission = false;
  String error;
  List<Address> addresses;
  String address="Your Current Address";
  Map<String, double> _currentLocation;
  Map<String, double> _startLocation;





  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        _currentLocation = result;
      });
    });
  }

    initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

      try {
        _permission = await _location.hasPermission();
        location = await _location.getLocation();

        error = null;
        final coordinates =
        new Coordinates(location["latitude"], location["longitude"]);

        if (_permission) {
          addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
          address = addresses.first.addressLine;
        }
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'Permission denied';
        } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error =
          'Permission denied - please ask the user to enable it from the app settings';
        }

        location = null;
      }

      setState(() {
        _startLocation = location;
      });

  }



  Widget build(BuildContext context) {                    //currently only image carasoul added
    Widget image_carousel = new Container(                //pics cant be clicked
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );



    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text(address,style:TextStyle(height:100.0,color:Colors.red,),),            //add address here
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              onPressed: () {}),
//          new IconButton(
//              icon: Icon(
//                Icons.shopping_cart,
//                color: Colors.white,
//              ),
//              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('Admin'),
              accountEmail: Text('admin@admin.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red
              ),
            ),

//            body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories'),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Recent products'),),

          //grid view
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}