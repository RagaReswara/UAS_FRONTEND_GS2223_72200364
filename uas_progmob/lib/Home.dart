import 'package:flutter/material.dart';
import 'package:uas_progmob/Comments.dart';
import 'package:uas_progmob/Photos.dart';
import 'package:uas_progmob/Posts.dart';
import 'package:uas_progmob/Users.dart';

void main(
    ) =>
    runApp(const MyApp()
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Drawer Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                accountName: Text('JOJO'),
                accountEmail: Text('johanes.raga@si.ukdw.ac.id')),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('POSTS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Posts()));
              },
            ),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('COMMENTS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Comments()));
              },
            ),
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('PHOTOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Photos()));
              },
            ),
            ListTile(
              title: const Text('USERS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Users()));
              },
            ),
          ],
        ),
      ),
    );
  }
}