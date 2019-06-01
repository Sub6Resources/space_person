import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_person/pages/home_page.dart';
import 'package:space_person/shared_state/number_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NumberInSpaceBloc>.value(value: NumberInSpaceBloc()),
      ],
      child: MaterialApp(
        title: 'Space Person',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurpleAccent,
        ),
        home: HomePage(),
      ),
    );
  }
}
