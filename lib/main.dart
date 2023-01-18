import 'package:flutter/material.dart';

import 'Favourite.dart';
import 'Settings.dart';
import 'History.dart';

void main() {
  runApp(MangaDex());
}

class MangaDex extends StatefulWidget {
  MangaDex({super.key});

  @override
  State<MangaDex> createState() => _MangaDexState();
}

class _MangaDexState extends State<MangaDex> {
  int pageIndex = 0;
  final List<Widget> frontPages = [
    const FavouritePage(),
    const HistoryPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 103, 64),
        primaryColorDark: const Color.fromARGB(255, 230, 97, 62),
      ),
      home: Scaffold(
        body: frontPages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          backgroundColor: Color.fromARGB(255, 205, 106, 24),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
