import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.barAnimation,                       // Add this parameter
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final BarAnimation barAnimation;                   // Add this variable
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: Colors.white,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: destinations.map<NavigationDestination>((d) {
          return NavigationDestination(
            icon: Icon(d.icon),
            label: d.label,
          );
        }).toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}