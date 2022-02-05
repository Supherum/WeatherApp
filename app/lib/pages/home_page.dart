import 'package:app/custom_widget/information_items.dart';
import 'package:app/custom_widget/slive_header_delegate.dart';
import 'package:app/styles/color_styles.dart';
import 'package:app/styles/static_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late double heightTotal = MediaQuery.of(context).size.height;
  late double withTotal = MediaQuery.of(context).size.width;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliveHeaderDelegate(title: '22º', size: heightTotal / 3),
            pinned: true,
          ),
          SliverFillRemaining(
            fillOverscroll: true,
            hasScrollBody: true,
            child: Container(
              color: ColorStyles.colorWhite,
              child: Column(
                children: [
                  InformationItems().dateAndLocationWidget(
                      context, "Jueves 3 de Febrero", "Sevilla, Triana"),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: ColorStyles.colorLightGrey,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InformationItems().smallWheaterInformation(
                            withTotal / 3,
                            'Mínima',
                            Image.asset('assets/icons/hot.png',
                                width: 20, height: 20),
                            '15ºC'),
                        InformationItems().smallWheaterInformation(
                            withTotal / 3,
                            'Máxima',
                            Image.asset('assets/icons/hot.png',
                                width: 20, height: 20),
                            '24ºC')
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InformationItems().smallWheaterInformation(
                            withTotal / 3,
                            'Viento',
                            const Icon(
                              Icons.air,
                              size: 20,
                              color: Colors.black87,
                            ),
                            '18km/h'),
                        InformationItems().smallWheaterInformation(
                            withTotal / 3,
                            'Humedad',
                            Image.asset('assets/icons/humidity.png',
                                width: 20, height: 20),
                            '60%')
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InformationItems().smallWheaterInformation(
                            withTotal / 3,
                            'Presión',
                            const Icon(
                              Icons.ac_unit,
                              size: 20,
                              color: Colors.black87,
                            ),
                            '900hPa'),
                        InformationItems().smallWheaterInformation(
                            withTotal / 3,
                            'Visibilidad',
                            const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 20,
                              color: Colors.black87,
                            ),
                            '1.4km'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Próximos días:'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          InformationItems().weekItemInformation(
                              withTotal / 6,
                              "Lunes",
                              "19ºC",
                              const Icon(
                                Icons.cloud,
                                color: Colors.black54,
                              )),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottonNavbar(),
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
}
