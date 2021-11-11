import 'package:flutter/material.dart';
import 'package:mytiktok/homeContent.dart';

void main() {
  runApp(const TiktokApp());
}

class TiktokApp extends StatelessWidget {
  const TiktokApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tiktok',
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  int _selectedIndex = 0;

  static const List pageOptions=[
    HomeContent(),
    HomeContent(),
    HomeContent(),
    HomeContent(),
    HomeContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Acceuil'),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Découvrir'),
          BottomNavigationBarItem(icon: Image.asset('assets/images/tiktok_add.png', height: 25), label: 'Ajouter'),
          const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Boîte de réception'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil')
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}



