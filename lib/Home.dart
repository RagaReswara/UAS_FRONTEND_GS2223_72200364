import 'package:flutter/material.dart';
import 'package:uas_frontend_flutter/Posts.dart';
/*import 'mahasiswa/mahasiswa_get.dart';*/

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.title});

  final String title;

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MyApp(
      title: appTitle,
      home: Home(title: appTitle),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Home Drawer"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/logo-144.png'),
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
                          builder: (context) => const Posts_get()));
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            buildContainer(),
            buildContainer(),
            buildContainer(),
            buildCard()
          ],
        ),
      );
  }
  Card buildCard(){
    return Card(
      elevation: 8,
      child: Column(
        children: [
          ListTile(
              leading: Icon(Icons.add_to_photos_rounded),
              title: Text("Tiket To Mesir"),
              subtitle: Text("Just Need your Blood")
          ),
          Row(
            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("Buy")),
              TextButton(
                  onPressed: (){},
                  child: Text("View")),
              TextButton(
                  onPressed: (){},
                  child: Text("Close"))
            ],
          )
        ],
      ),
    );
  }
  Container buildContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5
        ),
      ),
      child: Text("Mitologi Mesir adalah himpunan mitos-mitos dari Mesir kuno, yang melukiskan tindakan-tindakan para dewa Mesir sebagai sarana untuk memahami dunia. Keyakinan-keyakinan yang terkandung dalam mitos-mitos ini merupakan bagian penting dalam agama Mesir kuno. Mitos-mitos sering muncul dalam sastra dan Seni Mesir Kuno, terutama dalam cerita-cerita pendek dan materi keagamaan seperti nyanyian pujian, teks ritual, teks pemakaman, dan dekorasi kuil. Sumber-sumber ini jarang berisi versi lengkap sebuah mitos dan kebanyakan hanya mengandung bagian penggambaran singkatnya saja."),
      padding: EdgeInsets.all(10.0),
    );
  }
}