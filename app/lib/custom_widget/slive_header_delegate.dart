import 'package:app/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class SliveHeaderDelegate implements SliverPersistentHeaderDelegate {
  SliveHeaderDelegate(
      {required this.title,
      required this.size,
      required this.state,
      required this.backGround});

  final String title;
  final double size;
  final String state;
  final String backGround;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        _whatImage("time", backGround),
        fit: BoxFit.cover,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title + "ºC",
            style: FontSyles.headerStyle(50),
          ),
          Text(
            state,
            style: FontSyles.headerStyleStatus(25),
          )
        ],
      )
    ]);
  }

  String _whatImage(String time, String status) {
    if (status == "Clear") return 'assets/images/1.jpg';
    if (status == "Snow") return 'assets/images/5.jpg';
    if (status == "Rain")
      return 'assets/images/6.jpg';
    else
      return 'assets/images/2.jpg';
  }

  @override
  double get maxExtent => size;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      PersistentHeaderShowOnScreenConfiguration(
          maxShowOnScreenExtent: 0, minShowOnScreenExtent: 0);

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration =>
      FloatingHeaderSnapConfiguration(curve: Curves.ease);

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(stretchTriggerOffset: 1);

  @override
  TickerProvider? get vsync => throw Exception();
}
