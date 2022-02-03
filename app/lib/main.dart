import 'package:app/pages/configuration_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/mart_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context)=> const HomePage(),
        '/mart': (context)=> const MartPage(),
        '/configuration': (context)=> const ConfigurationPage()
      },
    );
  }
}
