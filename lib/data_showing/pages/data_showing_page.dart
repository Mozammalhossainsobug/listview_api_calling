import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listview_api_calling/data_showing/model/json_data_model.dart';
import 'package:listview_api_calling/data_showing/widgets/list_tile_widget.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<Item> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      
      setState(() {
        items = (jsonData as List)
            .map((itemJson) => Item.fromJson(itemJson))
            .toList();
        isLoading = false; // Set isLoading to false
      });

      Fluttertoast.showToast(
        msg: 'Successfully retrieved data',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else {
      throw Exception('Failed to load data. HTTP status: ${response.statusCode}');
    }
  } catch (e) {
    isLoading = false;
    setState(() {});
    
    Fluttertoast.showToast(
      msg: 'Error: $e',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Data'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: listTileWidget(
                        item.id.toString(),
                        (index + 1).toString(),
                        item.title,
                        item.body),
                  ),
                );
              },
            ),
    );
  }
}
