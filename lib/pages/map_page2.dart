import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage2 extends StatefulWidget {
  const MapPage2({super.key});

  @override
  State<MapPage2> createState() => _MapPage2State();
}

class _MapPage2State extends State<MapPage2> {
  static LatLng _GRB_Officer = LatLng(13.63469893593074, 101.10753465802827);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: _GRB_Officer, zoom: 15)),
    );
  }
}
