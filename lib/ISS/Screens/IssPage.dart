import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:space_rumble/ISS/Models/IssNowResponse.dart';

import '../../AppTheme.dart';
import '../../Network/api_client.dart';

class IssPage extends StatefulWidget {
  const IssPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<IssPage> createState() => _IssPageState();
}

class _IssPageState extends State<IssPage> {
  int _counter = 0;

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  FutureBuilder<IssNowResponse> _getIssPosition(BuildContext context) {

    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<IssNowResponse>(

      future: client.getIssNow(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final IssNowResponse? location = snapshot.data;
          return _buildIssLocation(context, location!);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.indigo,
              // backgroundColor: Colors.white,
            ),
          );
        }
      },
    );
  }

  Widget _buildIssLocation(BuildContext context, IssNowResponse location) {
    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(
        target: LatLng(double.parse(location.issPosition!.latitude.toString()), double.parse(location.issPosition!.longitude.toString())),
    zoom: 3.4746,
    ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);

      },
    );
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-51.4099, 125.0816),
      tilt: 90,
      zoom: 3);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: _getIssPosition(context),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(children: [
                Card(color: Colors.white, child: Icon(Icons.space_bar, size: 50,),),
                Text("Space Rumble", style: AppTheme.countryPickerText,)
              ],),
            ),
            Card(elevation: 8, color: Colors.white, margin: EdgeInsets.all(8), child: Row(children: [SizedBox(width: 8), Icon(Icons.newspaper), Expanded(child: ListTile(
              title: const Text('NASA'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ))],),),

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}