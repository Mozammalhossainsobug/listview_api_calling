import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listview_api_calling/DataShowing/model/jsonDataModel.dart';
import 'package:listview_api_calling/DataShowing/widgets/listTileWidget.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final jsonData = json.decode(response.body);

    setState(() {
      items = (jsonData as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Data'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                child: listTileWidget(item.id.toString(), item.uId.toString(),item.title,item.body),
              ),
          );
        },
      ),
    );
  }
}
