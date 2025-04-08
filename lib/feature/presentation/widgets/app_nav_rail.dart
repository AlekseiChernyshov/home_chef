import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

class AppNavRail extends StatelessWidget {
  const AppNavRail({
    super.key,
    required this.railAnimation,
    required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final RailAnimation railAnimation;
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavRailTransition(
      animation: railAnimation,
      backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        backgroundColor: backgroundColor,

        groupAlignment: 0.0,
        labelType: NavigationRailLabelType.selected,
        destinations:
            destinations.map((destination) {
              return NavigationRailDestination(
                icon: Icon(destination.icon),
                label: Text(destination.label),
                selectedIcon: Icon(destination.selectedIcon),
              );
            }).toList(),
      ),
    );
  }
}
