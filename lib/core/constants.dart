import 'package:flutter/material.dart';

// Навигационная панель показывает, больше или равна ширина экрана
// пороговому значению узкой ширины экрана; в противном случае для навигации используется панель навигации.
const double narrowScreenWidthThreshold = 450;

const double mediumWidthBreakpoint = 1000;
const double largeWidthBreakpoint = 1500;

const double transitionLength = 500;

// enum ScreenSelected {
//   component(0),
//   color(1),
//   typography(2),
//   elevation(3);
//
//   const ScreenSelected(this.value);
//   final int value;
// }