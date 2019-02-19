import 'package:bloc_example/blocs/bloc_provider.dart';
import 'package:bloc_example/blocs/districts_bloc.dart';
import 'package:bloc_example/pages/districts_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DistrictsPage(title: 'Bloc Pattern Example Page'),
    );
  }
}
