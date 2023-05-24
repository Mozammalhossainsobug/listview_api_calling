import 'package:flutter/material.dart';


ListTile listTileWidget(String itemId, String userId, String title, String body) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.blue,
      child: Text(userId, style: const TextStyle(color: Colors.white)), 
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item ID: $itemId',
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.blueGrey,
            fontSize: 16.0
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          title, /*...*/
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700
          ),
        ),
      ],
    ),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Text(
        body,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 14.0)
      ),
    ),     
  );
}