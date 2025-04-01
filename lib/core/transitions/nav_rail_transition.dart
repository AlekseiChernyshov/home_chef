import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

// Класс NavRailTransition
// Этот виджет управляет анимацией перехода для боковой панели навигации (Navigation Rail).
class NavRailTransition extends StatefulWidget {
  const NavRailTransition({
    super.key,
    required this.animation,
    required this.backgroundColor,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;
  final Color backgroundColor;

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
    begin: ltr ? const Offset(-1, 0) : const Offset(1, 0),
    end: Offset.zero,
  ).animate(OffsetAnimation(parent: widget.animation));

  // Анимация изменения ширины (SizeAnimation).
  // Используется для плавного изменения ширины дочернего виджета.
  late final Animation<double> widthAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: AnimatedBuilder(
          animation: widthAnimation,
          builder: (context, child) {
            return Align(
              alignment: Alignment.topLeft,
              widthFactor: widthAnimation.value,
              child: FractionalTranslation(
                translation: offsetAnimation.value,
                child: widget.child,
              ),
            );
          },
        ),
      ),
    );
  }
}
