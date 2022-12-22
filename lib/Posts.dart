import 'package:flutter/material.dart';
import 'package:uas_frontend_flutter/Home.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Posts_get extends StatefulWidget {
  const Posts_get({Key? key}) : super(key: key);

  @override
  State<Posts_get> createState() => _Posts_getState();
}

class _Posts_getState extends State<Posts_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataPost();
  }

  Future _getDataPost() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get.clear();
          _get = data;
        });
      }
    } catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('POSTS'),
        ),
        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Mahasiswa_add()));
          },
        ),*/
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/logoipsum.png"),
                ),
                accountName: Text("JOJO"),
                accountEmail: Text("johanes.raga@si.ukdw.ac.id"),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)  => Home()));
                },
              ),
              /*ListTile(
                title: const Text('Mahasiswa'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mahasiswa_get()));
                },
              ),*/
            ],
          ),
        ),
    );
  }
}