import 'package:app/custom_widget/information_items.dart';
import 'package:app/custom_widget/slive_header_delegate.dart';
import 'package:app/models/response/current_weather_response.dart';
import 'package:app/models/response/forecast_weather_response.dart';
import 'package:app/services/weather_services.dart';
import 'package:app/styles/color_styles.dart';
import 'package:app/styles/font_styles.dart';
import 'package:app/styles/static_data.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late double heightTotal = MediaQuery.of(context).size.height;
  late double withTotal = MediaQuery.of(context).size.width;
  late Future<CurrentWeatherResponse> currentWeather;
  late Future<ForeCastResponse> forecast;

  @override
  void initState() {
    
    currentWeather = WeatherServices().getCurrentWeaher("58", "-133");
    forecast = WeatherServices().getForecast("58", "-133");
    super.initState();
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
        backgroundColor: ColorStyles.colorWhite,
        body: FutureBuilder<CurrentWeatherResponse>(
          future: currentWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var info = snapshot.data!;
              return CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: SliveHeaderDelegate(
                        title: info.main.temp.round().toString(),
                        size: heightTotal * 2 / 5,
                        state: info.weather[0].main,
                        backGround: info.weather[0].main),
                    pinned: true,
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    InformationItems().dateAndLocationWidget(
                        context,DateTime.fromMicrosecondsSinceEpoch( info.dt*1000).month.toString(), info.name.toString()),
                    Divider(
                        height: 1,
                        thickness: 1,
                        color: ColorStyles.colorLightGrey),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InformationItems().smallWheaterInformation(
                              withTotal / 3,
                              'Min',
                              Image.asset('assets/icons/hot.png',
                                  width: 20, height: 20),
                              info.main.tempMin.round().toString() + "ºC"),
                          InformationItems().smallWheaterInformation(
                              withTotal / 3,
                              'Max',
                              Image.asset('assets/icons/hot.png',
                                  width: 20, height: 20),
                              info.main.tempMax.round().toString() + "ºC")
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InformationItems().smallWheaterInformation(
                              withTotal / 3,
                              'Wind',
                              const Icon(
                                Icons.air,
                                size: 20,
                                color: Colors.black87,
                              ),
                              info.wind.speed.round().toString() + "hm/h"),
                          InformationItems().smallWheaterInformation(
                              withTotal / 3,
                              'Humidity',
                              Image.asset('assets/icons/humidity.png',
                                  width: 20, height: 20),
                              info.main.humidity.round().toString() + "%")
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InformationItems().smallWheaterInformation(
                              withTotal / 3,
                              'Pressure',
                              const Icon(
                                Icons.ac_unit,
                                size: 20,
                                color: Colors.black87,
                              ),
                              info.main.pressure.round().toString() + 'hPa'),
                          InformationItems().smallWheaterInformation(
                              withTotal / 3,
                              'Visibility',
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                                color: Colors.black87,
                              ),
                              double.parse((info.visibility / 1000)
                                          .toStringAsFixed(1))
                                      .toString() +
                                  'Km'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: withTotal / 9),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Próximos días :',
                            style: FontSyles.sectionText,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: FutureBuilder<ForeCastResponse>(
                                  future: forecast,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Container(
                                        height: 155,
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: _dailyWeather(
                                            snapshot.data!.daily),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return Text(snapshot.error.toString());
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ))
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: withTotal / 9),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Por horas :',
                            style: FontSyles.sectionText,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: withTotal/6),
                      child: FutureBuilder<ForeCastResponse>(
                          future: forecast,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _hourlyWeather(snapshot.data!.hourly);
                            }
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                  ])),
                ],
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: _bottonNavbar(),
      ),
    );
  }

  Widget _dailyWeather(List<Daily> list) {
    return SizedBox(
      height: 140,
      width: withTotal,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return InformationItems().weekItemInformation(
                  withTotal / 5,
                  "Day: " +DateTime.fromMillisecondsSinceEpoch(list.elementAt(index).dt*1000).day.toString() , 
                  list.elementAt(index).temp.eve.round().toString(),
                  Icon(Icons.cloud),
                  10);
            }),
  
    );
  }

  Widget _hourlyWeather(List<Hourly> list) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InformationItems().weatherInformationForHours(
                withTotal * 8 / 10,
                DateTime.fromMillisecondsSinceEpoch(list.elementAt(index).dt*1000).hour.toString(),
                Icon(
                  Icons.cloud,
                  size: 23,
                ),
                list.elementAt(index).feelsLike.round().toString(),
                10);
          }),
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
