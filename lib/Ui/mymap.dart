import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_prototype/Ui/report.dart';
import 'package:flutter_prototype/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(3.156383, 101.707506),
    zoom: 10.0,
  );

  static final Marker _marker = Marker(
    markerId: MarkerId('_marker'),
    infoWindow: InfoWindow(title: 'Breakdown Location'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(3.156383, 101.707506),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Report'),
          leading: Icon(null),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Search The location'),
                  onChanged: (value) {
                      print(value);
                  },
                ),
                    )),
                IconButton(
                  onPressed: () async {
                    var place = await LocationService()
                        .getPlace(_searchController.text);
                    _goToPlace(place);
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                markers: {_marker},
                initialCameraPosition: _initialPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: FloatingActionButton.extended(
            elevation: 10,
            onPressed: () {
              makeAReport(context);
            },
            label: Text('Make a Report'),
            icon: Icon(Icons.note_alt_outlined),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));
  }

  void makeAReport(context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Report()),
      );
}
