import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/UI/screens/news_details_screen.dart';

import './UI/screens/home_page.dart';
import './UI/screens/news_list.dart';
import './bloc/news_list_bloc.dart';
import './network/API.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      //routes: {NewsDetailScreen.ROUTE_NAME: (ctx) => NewsDetailScreen(_)},
    );
  }
}
