import 'package:app/custom_widget/information_items.dart';
import 'package:app/custom_widget/slive_header_delegate.dart';
import 'package:app/models/response/current_weather_response.dart';
import 'package:app/models/response/forecast_weather_response.dart';
import 'package:app/services/weather_services.dart';
import 'package:app/styles/color_styles.dart';
import 'package:app/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherPrincipal extends StatefulWidget {
  const WeatherPrincipal({ Key? key }) : super(key: key);

  @override
  _WeatherPrincipalState createState() => _WeatherPrincipalState();
}

class _WeatherPrincipalState extends State<WeatherPrincipal> {


  
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

  
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<CurrentWeatherResponse>(
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
                        context,
                        _whatDayIsToday(DateTime.fromMillisecondsSinceEpoch(
                            info.dt * 1000)),
                        info.name.toString()),
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
                      margin: const EdgeInsets.only(top: 20, bottom: 35),
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
                    Center(
                      child: SizedBox(
                        width: withTotal * 8 / 10,
                        child: Divider(
                            height: 1,
                            thickness: 1,
                            color: ColorStyles.colorLightGrey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: withTotal / 9),
                      child: Container(
                        margin: const EdgeInsets.only(top: 35, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Next Days :',
                            style: FontSyles.sectionText,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 35),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: FutureBuilder<ForeCastResponse>(
                                  future: forecast,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Container(
                                        height: 155,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child:
                                            _dailyWeather(snapshot.data!.daily),
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
                    Center(
                      child: SizedBox(
                        width: withTotal * 8 / 10,
                        child: Divider(
                            height: 1,
                            thickness: 1,
                            color: ColorStyles.colorLightGrey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: withTotal / 9),
                      child: Container(
                        margin: const EdgeInsets.only(top: 35, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'For Hours :',
                            style: FontSyles.sectionText,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                withTotal * 2 / 9,
                DateFormat.EEEE().format(DateTime.fromMillisecondsSinceEpoch(
                    list.elementAt(index).dt * 1000)),
                list.elementAt(index).temp.eve.round().toString() + "º",
                const Icon(Icons.cloud),
                10);
          }),
    );
  }

  Widget _hourlyWeather(List<Hourly> list) {
    return SizedBox(
      height: 270,
      width: withTotal,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: list.length,
          itemBuilder: (context, index) {
            var media="";
            if( DateTime.fromMillisecondsSinceEpoch(
                            list.elementAt(index).dt * 1000)
                        .hour
                        .toString().length==1){
                          media="0";

            }
            return InformationItems().weatherInformationForHours(
                withTotal * 8 / 10,
                DateFormat.E()
                        .format(DateTime.fromMillisecondsSinceEpoch(
                            list.elementAt(index).dt * 1000))
                        .toString() +
                    "  " +media+
                    DateTime.fromMillisecondsSinceEpoch(
                            list.elementAt(index).dt * 1000)
                        .hour
                        .toString() +
                    ":00",
                const Icon(
                  Icons.cloud,
                  size: 23,
                ),
                list.elementAt(index).feelsLike.round().toString() + "º",
                10);
          }),
    );
  }

  
  String _whatDayIsToday(DateTime dt) {
    String s;

    if (dt.day.toString().substring(1) == "1") s = "st";
    if (dt.day.toString().substring(1) == "2")
      s = "snd";
    else
      s = "th";

    return DateFormat.EEEE().format(dt).toString() +
        ", " +
        DateFormat.d().format(dt).toString() +
        s +
        " " +
        DateFormat.MMMM().format(dt).toString();
  }

}