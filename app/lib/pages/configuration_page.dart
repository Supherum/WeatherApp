import 'package:app/utils/google_maps/page.dart';
import 'package:app/utils/preference_saves.dart';
import 'package:app/utils/preferences.dart';
import 'package:flutter/material.dart';
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

typedef MarkerUpdateAction = Marker Function(Marker marker);

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  _ConfigurationPageState();

  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;

  LatLng? _lastTap;
  LatLng _new = LatLng(37.37, -6.01);

  late String latitud = PreferenceUtils.getString(LAT)!;
  late String longitud = PreferenceUtils.getString(LON)!;

  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
  }

  void setLatLon() {
    latitud = PreferenceUtils.getString(LATLON)!.split(",")[0];
    latitud = latitud.split("(")[1];
    PreferenceUtils.setString(LAT, latitud);

    longitud = PreferenceUtils.getString(LATLON)!.split(",")[1];
    longitud = longitud.split(")")[0];
    longitud = longitud.substring(1, longitud.length - 1);
    PreferenceUtils.setString(LON, longitud);
  }

  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
        onMapCreated: onMapCreated,
        markers: <Marker>{_createMarker()},
        initialCameraPosition: _kInitialPosition,
        onTap: (LatLng pos) {
          setState(() {
            _lastTap = pos;
            _new = _lastTap!;
            PreferenceUtils.setString(LATLON, pos.toString());
          });
        });

    final List<Widget> columnChildren = <Widget>[
      Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 40,
            child: googleMap,
          ),
          Positioned(
            left: 25,
            bottom: 25,
            child: ElevatedButton(
                onPressed: () => setState(() {
                      setLatLon();
                    }),
                child: Text('Save location')),
          ),
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

  Marker _createMarker() {
    return Marker(markerId: const MarkerId("marker"), position: _new);
  }
}
