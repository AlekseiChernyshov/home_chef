import 'package:flutter/material.dart';

class Destination {
  const Destination(this.label, this.icon, this.selectedIcon);
  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

const List<Destination> destinations = <Destination>[
  Destination('Home', Icons.home_outlined, Icons.home ),
  Destination('Search', Icons.screen_search_desktop_outlined, Icons.screen_search_desktop_rounded,),
  Destination('Favorite', Icons.favorite_outline, Icons.favorite),
  Destination('Settings', Icons.settings_display, Icons.settings_display_rounded),
];