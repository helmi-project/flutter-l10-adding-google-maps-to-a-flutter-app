import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MapMarkers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LatLng _location = const LatLng(43.6425701, -79.3892455);

  GoogleMapController mapController;
  void _myMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
        ),
        body: GoogleMap(
          //Mengatur tipe map
          mapType: MapType.hybrid,

          //cnTowerkarker
          markers: {cnTowerkarker},

          onMapCreated: _myMapCreated,
          initialCameraPosition: CameraPosition(target: _location, zoom: 13.0),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: gotoNiagaraFalls,
          label: Text('To Niagara Falls!'),
          icon: Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  //Pindah peta
  static final CameraPosition NiagaraFalls = CameraPosition(
    target: LatLng(43.0807790, -79.0785500),
    //Animasi pindah kamera bearing dan tilt
    bearing: 45.0,
    tilt: 50.0,
    zoom: 14.0,
  );

  //pindah kamera
  Future<void> gotoNiagaraFalls() async {
    final GoogleMapController controller = await mapController;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(NiagaraFalls),
    );
  }
}
