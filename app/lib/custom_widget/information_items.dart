import 'package:app/styles/color_styles.dart';
import 'package:app/styles/font_styles.dart';
import 'package:app/styles/padding_styles.dart';
import 'package:flutter/material.dart';

class InformationItems {

  
  Widget dateLocation(context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Container(
          color: ColorStyles.colorWhite,
          child: Padding(
            padding: EdgeInsets.only(left: PaddingStyle.bodyPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 3,top: 5),
                    child: Text(
                      'Jueves 3 de Febrero',
                      style: FontSyles.dayStyle,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorStyles.colorLightGrey,
                    ),
                    Text(
                      'Sevilla, Triana',
                      style: FontSyles.locationStyle,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

}