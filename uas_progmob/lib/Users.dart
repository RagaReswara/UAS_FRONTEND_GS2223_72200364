import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _Users_getState();
}

class _Users_getState extends State<Users> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataUsers();
  }

  Future _getDataUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

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
        appBar: AppBar(title: Text('GET USER')),
        body: RefreshIndicator(
          onRefresh: _getDataUsers,
          child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      title: Text(_get[index]['name']),
                      subtitle: Text(_get[index]['username']),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                );
              }),
        ));
  }
}