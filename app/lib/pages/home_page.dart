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
      body: _HeaderScrollVew()
    );
  }

  Widget _HeaderScrollVew() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/2.jpg',
              fit: BoxFit.cover,
            ),
            title: Text('22ºC',style: TextStyle(fontSize: 40),),
            centerTitle: true,
          ),
          expandedHeight: 250,
          floating: false,
          pinned: true,
        ),
        const SliverFillRemaining(
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
            child: Center(
              child: Text('Texto Relleno'),
            ),
          ),
        ),
      ],
    );
  }
}
