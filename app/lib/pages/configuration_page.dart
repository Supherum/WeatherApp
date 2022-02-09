import 'dart:async';

import 'package:app/utils/google_maps/page.dart';
import 'package:app/utils/preference_saves.dart';
import 'package:app/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition _kInitialPosition =
    CameraPosition(target: LatLng(37, -6), zoom: 11.0);

class MapClickPage extends GoogleMapExampleAppPage {
  MapClickPage() : super(const Icon(Icons.mouse), 'Map click');

  @override
  Widget build(BuildContext context) {
    return const ConfigurationPage();
  }
}

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  _ConfigurationPageState();

  GoogleMapController? mapController;
  LatLng? _lastTap;
  late String latitud=PreferenceUtils.getString(LAT)!;
  late String longitud=PreferenceUtils.getString(LON)!;

  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
  }

  void setLatLon (){

    latitud= PreferenceUtils.getString(LATLON)!.split(",")[0];
    latitud=latitud.split("(")[1];
    PreferenceUtils.setString(LAT, latitud);

    longitud=PreferenceUtils.getString(LATLON)!.split(",")[1];
    longitud=longitud.split(")")[0];
    PreferenceUtils.setString(LON,longitud);

  }
    final MarkerId markerId = MarkerId("1");
/*
  final Marker marker = Marker(
      markerId: markerId,
      position: LatLng( new LatLng(12.43,2432)),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () => _onMarkerTapped(markerId),
      onDragEnd: (LatLng position) => _onMarkerDragEnd(markerId, position),
      onDrag: (LatLng position) => _onMarkerDrag(markerId, position),
    );

*/
  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
        onMapCreated: onMapCreated,
        //markers: Set<Marker>.of([marker]),
        initialCameraPosition: _kInitialPosition,
        onTap: (LatLng pos) {
          setState(() {
            _lastTap = pos;
            PreferenceUtils.setString(LATLON, pos.toString());
          });
        });

    final List<Widget> columnChildren = <Widget>[
      Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 500.0,
            child: googleMap,
          ),
          Text(_lastTap.toString()),
          Text(latitud+"   "+longitud),
          Text(PreferenceUtils.getString(LON)!),
          Text(PreferenceUtils.getString(LAT)!),
          ElevatedButton(onPressed: ()=>setState(() {
            setLatLon();
          }) , child: Text('Save location'))
        ],
      )
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );
  }

  void onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });
  }
}
