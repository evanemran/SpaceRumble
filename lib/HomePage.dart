import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_rumble/ISS/Screens/IssPage.dart';

import 'AppTheme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Widget _buildHomeGrids(BuildContext context){
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

      //1st line
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),), onTap: () {},),
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/iss.jpg', height: 100, width: 100,), Text("ISS")],),), onTap: () {onGridClicked("ISS");}),
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/spacex.png', height: 100, width: 100,), Text("SpaceX")],),),),
      ],),

      //2nd line
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),),
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),),
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),),
      ],),

      //3rd line
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),),
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),),
        InkWell(child: Card(elevation: 8, child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),),
      ],)
      // Row(children: [
      //   InkWell(child: Column(children: [Image.asset('assets/images/nasaa.png', height: 100, width: 100,), Text("NASA")],),),
      // ],)
    ],), );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(child:
      _buildHomeGrids(context),),
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

  void onGridClicked(String title){
    switch (title){
      case "NASA":
        // TODO

      case "ISS":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IssPage(title: 'ISS',)),
      );
      break;

    }
  }
}