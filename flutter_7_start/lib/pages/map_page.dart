
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map_page extends StatefulWidget{
  final String map_name;
  map_page(this.map_name);

  @override
  _map_pageState createState() => _map_pageState();
}

class _map_pageState extends State<map_page>{

  static const LatLng _pGooglePlex = LatLng(37.42796133580664, -122.085749655962);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Map Page', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      ),
      body: GoogleMap(initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 13),),
    );
  }

}

