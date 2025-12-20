import 'package:flutter/material.dart';
import 'package:flutter_mapp/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_mapp/ui/profile/widgets/profile_screen.dart';

import 'ui/home/widgets/home_screen.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _currentIndex = 0;
  final _screens = [HomeScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.green),
            label: 'Home',
            selectedIcon: Icon(Icons.home, color: Colors.green,),
          ),
          NavigationDestination(icon: Icon(Icons.person_outline, color: Colors.green,), label: 'Profile', selectedIcon: Icon(Icons.person, color: Colors.green,),)
        ],
      ),
    );
  }
}
