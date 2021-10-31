import 'package:flutter/material.dart';

class ListTileContents extends StatefulWidget {
  @override
  _ListTileContentsState createState() => _ListTileContentsState();
}

class _ListTileContentsState extends State<ListTileContents> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text('df');
        });
  }


}
