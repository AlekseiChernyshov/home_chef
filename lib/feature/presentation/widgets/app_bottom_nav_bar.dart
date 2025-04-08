import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.backgroundColor,
    required this.barAnimation,                       
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final Color backgroundColor;
  final BarAnimation barAnimation;                   
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: backgroundColor,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        destinations: destinations.map<NavigationDestination>((destination) {
          return NavigationDestination(
            icon: Icon(destination.icon),
            label: destination.label,
            selectedIcon: Icon(destination.selectedIcon),
          );
        }).toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}