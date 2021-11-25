import 'package:covidapp/providers/covid_provider.dart';
import 'package:covidapp/providers/history_confirm_provider.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:covidapp/providers/country_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CovidProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConfirmedProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
