import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FabNavigation extends StatefulWidget {
  @override
  _FabNavigationState createState() => _FabNavigationState();
}

class _FabNavigationState extends State<FabNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return mainContent();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget mainContent()
  {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: null ),
      bottomNavigationBar: BottomNavigationBar(items:  const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text('Business'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('School'),
        ),
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
    
  }
}
