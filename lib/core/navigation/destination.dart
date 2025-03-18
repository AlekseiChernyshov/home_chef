import 'package:flutter/material.dart';

class Destination {
  const Destination(this.icon, this.label);
  final IconData icon;
  final String label;
}

const List<Destination> destinations = <Destination>[
  Destination(Icons.home_filled, 'Home'),
  Destination(Icons.search_rounded, 'Search'),
  Destination(Icons.favorite_border, 'Favorite'),
  Destination(Icons.settings, 'Settings'),
];