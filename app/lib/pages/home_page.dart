import 'package:app/pages/configuration_page.dart';
import 'package:app/pages/mart_page.dart';
import 'package:app/pages/weather_principal.dart';
import 'package:app/styles/color_styles.dart';
import 'package:app/styles/static_data.dart';
import 'package:app/utils/preference_saves.dart';
import 'package:app/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  SharedPreferences? preferences;

  late double heightTotal = MediaQuery.of(context).size.height;
  late double withTotal = MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        backgroundColor: ColorStyles.colorWhite,
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: _bottonNavbar(),
      ),
    );
  }

  Widget _bottonNavbar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(StaticData.bottonNavbarRadius),
              topRight: Radius.circular(StaticData.bottonNavbarRadius)),
          boxShadow: const [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(StaticData.bottonNavbarRadius),
              topRight: Radius.circular(StaticData.bottonNavbarRadius)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.public),
                label: 'Mart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_sharp),
                label: 'Settings',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent[400],
            onTap: _onItemTapped,
          )),
    );
  }

  static List<Widget> _widgetOptions = [
    WeatherPrincipal(),
    MartPage(),
    ConfigurationPage(),
  ];
}
