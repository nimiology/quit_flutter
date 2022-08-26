import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quit/providers/doing_provider.dart';
import 'package:quit/providers/quit_period.dart';
import 'package:quit/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: QuitPeriod()),
        ChangeNotifierProvider.value(value: Doing()),
      ],
      child: MaterialApp(
        title: 'Quit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const HomeScreen(),
      ),
    );
  }
}