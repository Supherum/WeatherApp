import 'package:app/styles/color_styles.dart';
import 'package:app/styles/font_styles.dart';
import 'package:app/styles/static_data.dart';
import 'package:flutter/material.dart';

class InformationItems {
  Widget dateAndLocationWidget(context, String day, String location) {
    return Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        color: ColorStyles.colorWhite,
        padding: EdgeInsets.only(left: StaticData.bodyPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 3, top: 5),
                child: Text(
                  day,
                  style: FontSyles.dayStyle,
                )),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: ColorStyles.colorLightGrey,
                ),
                Text(
                  location,
                  style: FontSyles.locationStyle,
                )
              ],
            )
          ],
        ));
  }

  Widget smallWheaterInformation(
      double withTotal, String title, Widget icon, String info) {
    return Container(
      width: withTotal,
      height: 70,
      padding: EdgeInsets.all(StaticData.boxInformationPadding),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                icon,
                Container(
                    margin: const EdgeInsets.only(left: 6), child: Text(title))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              info,
              style: FontSyles.weatherResults,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(color: ColorStyles.colorLightGrey, width: 0),
          color: ColorStyles.colorWhite,
          borderRadius: BorderRadius.all(
              Radius.circular(StaticData.boxInformationBorder)),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 5)]),
    );
  }

  Widget weekItemInformation(double size, String dayName, String avrgTemp,
      String icon, double margLeft) {
    Image newImage;
    if (icon.contains("clear")) {
      newImage = Image.network(
          'https://img.icons8.com/external-kmg-design-flat-kmg-design/344/external-sun-summer-kmg-design-flat-kmg-design.png');
    }

    if (icon.contains("cloud")) {
      newImage = Image.network(
          'https://img.icons8.com/external-justicon-flat-justicon/344/external-cloudy-weather-justicon-flat-justicon-1.png');
    }

    if (icon.contains("snow")) {
      newImage = Image.network(
          'https://img.icons8.com/external-flatart-icons-flat-flatarticons/344/external-snowflake-canada-independence-day-flatart-icons-flat-flatarticons-1.png');
    }

    if (icon.contains("rain")) {
      newImage = Image.network(
          'https://img.icons8.com/external-wanicon-flat-wanicon/344/external-rain-nature-wanicon-flat-wanicon.png');
    } else {
      newImage = Image.network(
          'https://img.icons8.com/external-justicon-flat-justicon/344/external-cloud-weather-justicon-flat-justicon.png');
    }
    return Container(
      margin: EdgeInsets.only(left: margLeft),
      width: size,
      padding: EdgeInsets.all(StaticData.boxInformationPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dayName,
            style: FontSyles.dayName,
          ),
          newImage,
          Text(
            avrgTemp,
            style: FontSyles.temperatureDay,
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(color: ColorStyles.colorLightGrey, width: 1),
          color: ColorStyles.colorWhite,
          borderRadius: BorderRadius.all(
              Radius.circular(StaticData.boxInformationBorder)),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 1)]),
    );
  }

  Widget weatherInformationForHours(double sizeTotal, String hour, String icon,
      String temp, double marginTop) {
    Image newImage;
    if (icon.contains("clear")) {
      newImage = Image.network(
          'https://img.icons8.com/external-kmg-design-flat-kmg-design/344/external-sun-summer-kmg-design-flat-kmg-design.png');
    }

    if (icon.contains("cloud")) {
      newImage = Image.network(
          'https://img.icons8.com/external-justicon-flat-justicon/344/external-cloudy-weather-justicon-flat-justicon-1.png');
    }

    if (icon.contains("snow")) {
      newImage = Image.network(
          'https://img.icons8.com/external-flatart-icons-flat-flatarticons/344/external-snowflake-canada-independence-day-flatart-icons-flat-flatarticons-1.png');
    }

    if (icon.contains("rain")) {
      newImage = Image.network(
          'https://img.icons8.com/external-wanicon-flat-wanicon/344/external-rain-nature-wanicon-flat-wanicon.png');
    } else {
      newImage = Image.network(
          'https://img.icons8.com/external-justicon-flat-justicon/344/external-cloud-weather-justicon-flat-justicon.png');
    }

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        width: sizeTotal,
        height: 35,
        padding: EdgeInsets.symmetric(
            vertical: StaticData.boxInformationPadding, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(hour),
            newImage,
            Text(
              temp,
              style: FontSyles.weatherSmallResults,
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(color: ColorStyles.colorLightGrey, width: 0),
            color: ColorStyles.colorWhite,
            borderRadius: BorderRadius.all(
                Radius.circular(StaticData.boxInformationBorder)),
            boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 1)]),
      ),
    );
  }
}
