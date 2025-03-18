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
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);

  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      vsync: this);

  late final _railAnimation = RailAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  late final Animation<double> _widthAnimation = Tween<double>(begin: 72, end: 160).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  );

  bool isExtended = false;
  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateAnimationState();
  }

  @override
  void didUpdateWidget(ScaffoldWithNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateAnimationState();
  }

  void _updateAnimationState() {
    final double width = MediaQuery.of(context).size.width;
    final AnimationStatus status = _controller.status;

    if (width > 1000) {
      isExtended = true;
      if (status != AnimationStatus.forward && status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else if (width > 600) {
      isExtended = false;
      if (status != AnimationStatus.forward && status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      isExtended = false;
      if (status != AnimationStatus.reverse && status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }

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
                isExtended: isExtended,
                selectedIndex: widget.navigationShell.currentIndex,
                backgroundColor: _backgroundColor,
                onDestinationSelected: (index) {
                  widget.navigationShell.goBranch(
                    index,
                    initialLocation: index == widget.navigationShell.currentIndex,
                  );
                },
                widthAnimation: _widthAnimation,
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
///
///
///
// class ScaffoldWithNavBar extends StatefulWidget {
//   const ScaffoldWithNavBar({
//     super.key,
//     required this.navigationShell,
//   });
//
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
// }
//
// class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar>
//     with SingleTickerProviderStateMixin {
//   // Получаем цветовую схему из текущей темы
//   late final _colorScheme = Theme.of(context).colorScheme;
//
//   // Определяем цвет фона с легким наложением основного цвета
//   late final _backgroundColor = Color.alphaBlend(
//       _colorScheme.primary.withValues(alpha: 0.14), _colorScheme.surface);
//
//   // Создаём контроллер анимации для различных анимационных элементов
//   late final _controller = AnimationController(
//       duration: const Duration(milliseconds: 1000), // Длительность анимации
//       reverseDuration: const Duration(milliseconds: 1250), // Длительность обратной анимации
//       value: 0, // Начальное значение
//       vsync: this);
//
//   // Различные анимации, управляемые контроллером
//   late final _railAnimation = RailAnimation(parent: _controller);
//   late final _barAnimation = BarAnimation(parent: _controller);
//
//   bool isExtended = false; // Состояние расширения рельсов.
//   bool controllerInitialized = false; // Флаг инициализации контроллера
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateAnimationState();
//   }
//
//   @override
//   void didUpdateWidget(ScaffoldWithNavBar oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _updateAnimationState();
//   }
//
//   void _updateAnimationState() {
//     final double width = MediaQuery.of(context).size.width;
//     final AnimationStatus status = _controller.status;
//
//     if (width > 1000) {
//       // Если ширина экрана больше 1000, включаем расширенные рельсы.
//       isExtended = true;
//       if (status != AnimationStatus.forward &&
//           status != AnimationStatus.completed) {
//         _controller.forward();
//       }
//     } else if (width > 600) {
//       // Если ширина экрана больше 600, но меньше 1000, показываем обычные рельсы.
//       isExtended = false;
//       if (status != AnimationStatus.forward &&
//           status != AnimationStatus.completed) {
//         _controller.forward();
//       }
//     } else {
//       // Если ширина экрана меньше 600, скрываем рельсы.
//       isExtended = false;
//       if (status != AnimationStatus.reverse &&
//           status != AnimationStatus.dismissed) {
//         _controller.reverse();
//       }
//     }
//
//     // Устанавливаем стартовое значение анимации, если контроллер ещё не был инициализирован.
//     if (!controllerInitialized) {
//       controllerInitialized = true;
//       _controller.value = width > 600 ? 1 : 0;
//     }
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //
//   //   final double width = MediaQuery.of(context).size.width; // Получаем ширину экрана
//   //   final AnimationStatus status = _controller.status;
//   //
//   //   // Если ширина экрана больше 600 пикселей (пример: планшеты и большие экраны), запускаем анимацию
//   //   if (width > 600) {
//   //     if (status != AnimationStatus.forward &&
//   //         status != AnimationStatus.completed) {
//   //       _controller.forward();
//   //     }
//   //   } else {
//   //     // Если ширина экрана меньше 600 пикселей, запускаем обратную анимацию
//   //     if (status != AnimationStatus.reverse &&
//   //         status != AnimationStatus.dismissed) {
//   //       _controller.reverse();
//   //     }
//   //   }
//   //
//   //   // Устанавливаем стартовое значение анимации, если контроллер ещё не был инициализирован
//   //   if (!controllerInitialized) {
//   //     controllerInitialized = true;
//   //     _controller.value = width > 600 ? 1 : 0;
//   //   }
//   // }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller, // Подписываемся на изменения анимации
//       builder: (context, _) {
//         return Scaffold(
//           body: Row(
//             children: [
//               // Боковая панель навигации с анимацией исчезновения
//               AppNavRail(
//                 railAnimation: _railAnimation,
//                 isExtended: isExtended,
//                 selectedIndex: widget.navigationShell.currentIndex, // Используем currentIndex из navigationShell
//                 backgroundColor: _backgroundColor,
//                 onDestinationSelected: (index) {
//                   // Используем goBranch для навигации
//                   widget.navigationShell.goBranch(
//                     index,
//                     // Если нужно сохранить историю навигации, установите true
//                     initialLocation: index == widget.navigationShell.currentIndex,
//                   );
//                 },
//               ),
//               // Основной контент
//               Expanded(
//                 child: widget.navigationShell,
//               ),
//             ],
//           ),
//
//           bottomNavigationBar: AppBottomNavBar(
//             barAnimation: _barAnimation,
//             selectedIndex: widget.navigationShell.currentIndex, // Используем currentIndex из navigationShell
//             onDestinationSelected: (index) {
//               // Используем goBranch для навигации
//               widget.navigationShell.goBranch(
//                 index,
//                 // Если нужно сохранить историю навигации, установите true
//                 initialLocation: index == widget.navigationShell.currentIndex,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
