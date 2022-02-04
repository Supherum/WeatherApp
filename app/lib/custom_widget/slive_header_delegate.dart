import 'package:app/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

class SliveHeaderDelegate implements SliverPersistentHeaderDelegate{

  SliveHeaderDelegate({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
     return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/2.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          child: Text(title, style: FontSyles.headerStyle(40),),alignment: Alignment.center),
        
       ]);
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => PersistentHeaderShowOnScreenConfiguration(maxShowOnScreenExtent: 0,minShowOnScreenExtent: 0);

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => FloatingHeaderSnapConfiguration(curve: Curves.ease);

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration =>OverScrollHeaderStretchConfiguration(stretchTriggerOffset: 1);

  @override
  TickerProvider? get vsync => throw Exception() ;
  
}