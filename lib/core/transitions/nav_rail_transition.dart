import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

// Класс NavRailTransition
// Этот виджет управляет анимацией перехода для боковой панели навигации (Navigation Rail).
class NavRailTransition extends StatefulWidget {
  const NavRailTransition({
    super.key,
    required this.animation, // Анимация, которая управляет переходом.
    required this.backgroundColor, // Цвет фона для анимации.
    required this.child, // Дочерний виджет, который будет анимирован.
    required this.railWidth,
  });

  final Animation<double> animation; // Родительская анимация.
  final Widget child; // Дочерний виджет, который анимируется.
  final Color backgroundColor; // Цвет фона для анимации.
  final double railWidth; // Ширина рельсов.

  @override
  State<NavRailTransition> createState() => _NavRailTransitionState();
}

// Состояние для NavRailTransition.
class _NavRailTransitionState extends State<NavRailTransition> {
  // Определяем направление текста (слева направо или справа налево).
  // Это важно для анимации, так как она зависит от направления.
  late final bool ltr = Directionality.of(context) == TextDirection.ltr;

  // Анимация смещения (OffsetAnimation).
  // Используется для плавного перемещения дочернего виджета.
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: ltr ? const Offset(-1, 0) : const Offset(1, 0), // Начальное смещение.
    end: Offset.zero, // Конечное смещение (виджет на своём месте).
  ).animate(OffsetAnimation(parent: widget.animation));

  // Анимация изменения ширины (SizeAnimation).
  // Используется для плавного изменения ширины дочернего виджета.
  late final Animation<double> widthAnimation = Tween<double>(
    begin: 0, // Начальная ширина (0 — виджет скрыт).
    end: 1, // Конечная ширина (1 — виджет полностью виден).
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      // ClipRect обрезает содержимое, чтобы оно не выходило за пределы виджета.
      child: DecoratedBox(
        // DecoratedBox добавляет фон для анимации.
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: AnimatedBuilder(
          // AnimatedBuilder перестраивает виджет при изменении анимации.
          animation: widthAnimation,
          builder: (context, child) {
            return Align(
              // Align выравнивает дочерний виджет по верхнему левому краю.
              alignment: Alignment.topLeft,
              // widthFactor управляет шириной дочернего виджета.
              widthFactor: widthAnimation.value,
              child: FractionalTranslation(
                // FractionalTranslation применяет смещение к дочернему виджету.
                translation: offsetAnimation.value,
                child: SizedBox(
                  width: widget.railWidth,
                    child: widget.child), // Дочерний виджет, который анимируется.
              ),
            );
          },
        ),
      ),
    );
  }
}