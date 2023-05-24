import 'package:flutter/material.dart';
import 'package:listview_api_calling/src/feature/data_showing/pages/data_showing_page.dart';
import 'package:listview_api_calling/src/core/route/routes_constant.dart';


Route<dynamic>? generateRoute(RouteSettings settings) {

  switch (settings.name) {
     case dataShowingPage:
      return MaterialPageRoute(builder: (context) => MyListView());

     default:
       return null;
  }
}