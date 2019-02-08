// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'placeholder_widget.dart';
// import 'package:flutter/services.dart';
// import 'package:location/location.dart';
// import 'package:geocoder/geocoder.dart';

// // class Home extends StatefulWidget {
// //   State createState() => new _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   StreamSubscription<Map<String, double>> _locationSubscription;
// //   Location _location = new Location();
// //   bool _permission = false;
// //   String error;
// //   List<Address> addresses;
// //   String address="Your Current Address";

// //   Map<String, double> _currentLocation;
// //   Map<String, double> _startLocation;

// //   @override
// //   void initState() {
// //     super.initState();

// //     initPlatformState();

// //     _locationSubscription =
// //         _location.onLocationChanged().listen((Map<String, double> result) {
// //       setState(() {
// //         _currentLocation = result;
// //       });
// //     });
// //   }

// //   initPlatformState() async {
// //     Map<String, double> location;
// //     // Platform messages may fail, so we use a try/catch PlatformException.

// //       try {
// //         _permission = await _location.hasPermission();
// //         location = await _location.getLocation();

// //         error = null;
// //         final coordinates =
// //         new Coordinates(location["latitude"], location["longitude"]);

// //         if (_permission) {
// //           addresses =
// //           await Geocoder.local.findAddressesFromCoordinates(coordinates);
// //           address = addresses.first.addressLine;
// //         }
// //       } on PlatformException catch (e) {
// //         if (e.code == 'PERMISSION_DENIED') {
// //           error = 'Permission denied';
// //         } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
// //           error =
// //           'Permission denied - please ask the user to enable it from the app settings';
// //         }

// //         location = null;
// //       }

// //       setState(() {
// //         _startLocation = location;
// //       });

// //   }

//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     //callthe homescreenWidget classes here

//   ];

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           //title: Text(address),

//         ),
//         body: _children[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           //onTap: onTabTapped,
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.home),
//               title: new Text('Home'), //button for homebar
//             ),
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.event_note),
//               title: new Text('Blogs'), //button for blogs
//             ),
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.person),
//               title: new Text('Profile'), //button for profile menu
//             ),
//             BottomNavigationBarItem(
//               icon: new Icon(Icons.local_mall),
//               title: new Text('Categories'), //button for categories
//             ),
//           ],
//           type: BottomNavigationBarType.fixed,
//         ));
//   }

// //   void onTabTapped(int index) {
// //     //setState(() {
// //       _currentIndex = index;
// //     });
// //   }
// // }
