import 'dart:async';

import 'package:app/utils/google_maps/page.dart';
import 'package:app/utils/preference_saves.dart';
import 'package:app/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition _kInitialPosition =
    CameraPosition(target: LatLng(-33.852, 151.211), zoom: 11.0);

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
  LatLng? _lastLongPress;
  String lat = "0";

  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: _kInitialPosition,
        onTap: (LatLng pos) {
          setState(() {
            _lastTap = pos;
            PreferenceUtils.setString(LAT, pos.toString());
            lat = PreferenceUtils.getString(LAT).toString();
          });
        });

    final List<Widget> columnChildren = <Widget>[
      Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: googleMap,
          ),
          Text(_lastTap.toString()),
          Text(lat)
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
