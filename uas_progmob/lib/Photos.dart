import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Photos extends StatefulWidget {
  const Photos ({super.key});

  @override
  State<Photos> createState() => _Photos_getState();
}

class _Photos_getState extends State<Photos> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataPhotos();
  }

  Future _getDataPhotos() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _get.clear();
          _get = data;
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GET Photos')),
        body: RefreshIndicator(
          onRefresh: _getDataPhotos,
          child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue
                          , width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(_get[index]['title']),
                    /*trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        }),*/
                  ),
                  )
                );
              }),
        ));
  }
}