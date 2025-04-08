import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_chef/core/core.dart';
import 'package:home_chef/feature/feature.dart';

/// Строительные леса с навигационной панелью
class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
    with SingleTickerProviderStateMixin {

  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      vsync: this);

  late final _railAnimation = RailAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width; // Получаем ширину экрана
    final AnimationStatus status = _controller.status;

    // Если ширина экрана больше 600 пикселей (пример: планшеты и большие экраны), запускаем анимацию
    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      // Если ширина экрана меньше 600 пикселей, запускаем обратную анимацию
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }

    // Устанавливаем стартовое значение анимации, если контроллер ещё не был инициализирован
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
     final colorScheme = Theme.of(context).colorScheme;

     final Color backgroundColor = Color.alphaBlend(
      colorScheme.primary.withValues(alpha: 0.08), // Оттенок поверх `surface`
      colorScheme.surface, // Базовый цвет
    );
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              AppNavRail(
                railAnimation: _railAnimation,
                selectedIndex: widget.navigationShell.currentIndex,
                backgroundColor: backgroundColor,
                onDestinationSelected: _goBranch,
              ),
              Expanded(
                child: widget.navigationShell,
              ),
            ],
          ),
          bottomNavigationBar: AppBottomNavBar(
            backgroundColor: backgroundColor,
            barAnimation: _barAnimation,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          ),
        );
      },
    );
  }
}
