import 'package:flutter/material.dart';
import 'package:listview_api_calling/src/core/route/routes.dart';
import 'package:listview_api_calling/src/core/route/routes_constant.dart';
import 'package:listview_api_calling/src/feature/data_showing/pages/data_showing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API calling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: dataShowingPage,
      onGenerateRoute: generateRoute,
    );
  }
}
