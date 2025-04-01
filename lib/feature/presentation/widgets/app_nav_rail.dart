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

  final NavigationRailLabelType showLabels = NavigationRailLabelType.all;
  final NavigationRailLabelType hideLabels = NavigationRailLabelType.none;


  @override
  Widget build(BuildContext context) {
    return NavRailTransition(
      animation: railAnimation,
      backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        backgroundColor: backgroundColor,
        onDestinationSelected: onDestinationSelected,
        groupAlignment: -0.85,
        extended: false, // Управляем расширением текста.
        //labelType: isExtended ? hideLabels : showLabels,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}