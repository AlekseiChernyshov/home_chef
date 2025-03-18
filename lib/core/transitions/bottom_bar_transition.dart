import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

// Класс BottomBarTransition
// Этот виджет управляет анимацией перехода для нижней панели навигации (Bottom Navigation Bar).
class BottomBarTransition extends StatefulWidget {
  const BottomBarTransition({
    super.key,
    required this.animation, // Анимация, которая управляет переходом.
    required this.backgroundColor, // Цвет фона для анимации.
    required this.child, // Дочерний виджет, который будет анимирован.
  });

  final Animation<double> animation; // Родительская анимация.
  final Color backgroundColor; // Цвет фона для анимации.
  final Widget child;

  @override
  State<BottomBarTransition> createState() => _BottomBarTransition();
}

class _BottomBarTransition extends State<BottomBarTransition> {
  // Анимация смещения (OffsetAnimation).
  // Используется для плавного перемещения дочернего виджета.
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1), // Начальное смещение (виджет внизу за экраном).
    end: Offset.zero, // Конечное смещение (виджет на своём месте).
  ).animate(OffsetAnimation(parent: widget.animation));

  // Анимация изменения высоты (SizeAnimation).
  // Используется для плавного изменения высоты дочернего виджета.
  late final Animation<double> heightAnimation = Tween<double>(
    begin: 0, // Начальная высота (0 — виджет скрыт).
    end: 1, // Конечная высота (1 — виджет полностью виден).
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        // DecoratedBox добавляет фон для анимации.
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: Align(
          // Align выравнивает дочерний виджет по верхнему левому краю.
          alignment: Alignment.topLeft,
          // heightFactor управляет высотой дочернего виджета.
          heightFactor: heightAnimation.value,
          child: FractionalTranslation(
            // FractionalTranslation применяет смещение к дочернему виджету.
            translation: offsetAnimation.value,
            child: widget.child, // Дочерний виджет, который анимируется.
          ),
        ),
      ),
    );
  }
}