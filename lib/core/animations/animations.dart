import 'package:flutter/animation.dart';

// Класс BarAnimation, который расширяет ReverseAnimation.
// ReverseAnimation — это анимация, которая воспроизводит родительскую анимацию в обратном порядке.
class BarAnimation extends ReverseAnimation {
  BarAnimation({required AnimationController parent})
      : super(
    // Используем CurvedAnimation для создания анимации с нелинейной кривой.
    // CurvedAnimation позволяет задать кривую (curve) и обратную кривую (reverseCurve).
    CurvedAnimation(
      parent: parent, // Родительская анимация (AnimationController).
      curve: const Interval(0, 1 / 5), // Кривая для прямого воспроизведения.
      reverseCurve: const Interval(1 / 5, 4 / 5), // Кривая для обратного воспроизведения.
    ),
  );
}

// Класс OffsetAnimation, который расширяет CurvedAnimation.
// Используется для создания анимации смещения (offset) с нелинейной кривой.
class OffsetAnimation extends CurvedAnimation {
  OffsetAnimation({required super.parent})
      : super(
    // Задаём кривую для прямого воспроизведения.
    curve: const Interval(
      2 / 5, // Начало интервала (40% от общей длительности).
      3 / 5, // Конец интервала (60% от общей длительности).
      curve: Curves.easeInOutCubicEmphasized, // Используем встроенную кривую.
    ),
    // Задаём кривую для обратного воспроизведения.
    reverseCurve: Interval(
      4 / 5, // Начало интервала (80% от общей длительности).
      1, // Конец интервала (100% от общей длительности).
      curve: Curves.easeInOutCubicEmphasized.flipped, // Используем перевёрнутую кривую.
    ),
  );
}

// Класс RailAnimation, который расширяет CurvedAnimation.
// Используется для создания анимации, связанной с боковой панелью (rail).
class RailAnimation extends CurvedAnimation {
  RailAnimation({required super.parent})
      : super(
    // Задаём кривую для прямого воспроизведения.
    curve: const Interval(0 / 5, 4 / 5), // Интервал от 0% до 80%.
    // Задаём кривую для обратного воспроизведения.
    reverseCurve: const Interval(3 / 5, 1), // Интервал от 60% до 100%.
  );
}

// Класс SizeAnimation, который расширяет CurvedAnimation.
// Используется для создания анимации изменения размера.
class SizeAnimation extends CurvedAnimation {
  SizeAnimation({required super.parent})
      : super(
    // Задаём кривую для прямого воспроизведения.
    curve: const Interval(
      0 / 5, // Начало интервала (0% от общей длительности).
      3 / 5, // Конец интервала (60% от общей длительности).
      curve: Curves.easeInOutCubicEmphasized, // Используем встроенную кривую.
    ),
    // Задаём кривую для обратного воспроизведения.
    reverseCurve: Interval(
      2 / 5, // Начало интервала (40% от общей длительности).
      1, // Конец интервала (100% от общей длительности).
      curve: Curves.easeInOutCubicEmphasized.flipped, // Используем перевёрнутую кривую.
    ),
  );
}
