import 'package:app/custom_widget/information_items.dart';
import 'package:app/custom_widget/slive_header_delegate.dart';
import 'package:app/styles/color_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: SliveHeaderDelegate(title: '22º'),
          pinned: true,
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            children: [
              InformationItems().dateLocation(context),
              Divider(
                thickness: 1,
                color: ColorStyles.colorLightGrey,
              ),
              Container(
                color: ColorStyles.colorWhite,
              )
            ],
          ),
        )
      ],
    ));
  }

}
