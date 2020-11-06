import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker cnTowerkarker = Marker(
  markerId: MarkerId("CN Tower"),
  position: const LatLng(43.6425701, -79.3892455),
  infoWindow: InfoWindow(title: "Toronto Tower"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
);
