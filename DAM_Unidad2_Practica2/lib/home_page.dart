import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themeprovider.dart';
import 'login_page.dart';
import 'explore_page.dart';
import 'inicio_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _theme = false;

  void _switchTheme() {
    setState(() {
      _theme = !_theme;
    });
  }

  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Inicio(),
    Explore(),
    Login(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, notifier, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: () { notifier.toggleTheme(); _switchTheme(); },
                icon:  _theme ? const Icon(Icons.dark_mode) : const Icon(Icons.dark_mode_outlined)
            )
          ],
          title: Text('TecAI'),
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.rocket_launch),
                label: 'Explora'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: 'Cuenta'
            )
          ],
          selectedItemColor: const Color(0xFFeb5e28),
          selectedLabelStyle: const TextStyle(color: Color(0xFFeb5e28)),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}