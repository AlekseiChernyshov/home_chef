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
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withValues(alpha: 0.14), _colorScheme.surface);

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

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              AppNavRail(
                railAnimation: _railAnimation,
                selectedIndex: widget.navigationShell.currentIndex,
                backgroundColor: _backgroundColor,
                onDestinationSelected: (index) {
                  widget.navigationShell.goBranch(
                    index,
                    initialLocation: index == widget.navigationShell.currentIndex,
                  );
                },
              ),
              Expanded(
                child: widget.navigationShell,
              ),
            ],
          ),
          bottomNavigationBar: AppBottomNavBar(
            barAnimation: _barAnimation,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: (index) {
              widget.navigationShell.goBranch(
                index,
                initialLocation: index == widget.navigationShell.currentIndex,
              );
            },
          ),
        );
      },
    );
  }
}
