import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

// class AppNavRail extends StatelessWidget {
//   const AppNavRail({
//     super.key,
//     required this.railAnimation,
//     required this.backgroundColor,
//     required this.selectedIndex,
//     this.onDestinationSelected,
//     required this.isExtended,
//     required this.widthAnimation,
//
//   });
//
//   final RailAnimation railAnimation;
//   final Color backgroundColor;
//   final int selectedIndex;
//   final ValueChanged<int>? onDestinationSelected;
//   final bool isExtended;
//   final Animation<double> widthAnimation;
//
//   final NavigationRailLabelType showLabels = NavigationRailLabelType.all;
//   final NavigationRailLabelType hideLabels = NavigationRailLabelType.none;
//
//   @override
//   Widget build(BuildContext context) {
//     // Вычисляем ширину для AppNavRail на основе состояния isExtended
//     final double railWidth = isExtended ? 150 : 72;
//     return NavRailTransition(
//       animation: railAnimation,
//       backgroundColor: backgroundColor,
//       railWidth: railWidth,
//       child: SizedBox(
//         width: widthAnimation.value,
//         child: NavigationRail(
//           selectedIndex: selectedIndex,
//           backgroundColor: backgroundColor,
//           onDestinationSelected: onDestinationSelected,
//           groupAlignment: -0.85,
//           extended: isExtended,
//           labelType: isExtended ? hideLabels : showLabels,
//           destinations: destinations.map((d) {
//             return NavigationRailDestination(
//               icon: Icon(d.icon),
//               label: Text(d.label),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
class AppNavRail extends StatefulWidget {
  const AppNavRail({
    super.key,
    required this.railAnimation,
    required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
    required this.isExtended,
    required this.widthAnimation
  });

  final RailAnimation railAnimation;
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final bool isExtended;
  final Animation<double> widthAnimation;

  @override
  State<AppNavRail> createState() => _AppNavRailState();
}

class _AppNavRailState extends State<AppNavRail> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  bool _isExtended = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _widthAnimation = Tween<double>(begin: 72, end: 160).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _isExtended = widget.isExtended;
    if (_isExtended) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AppNavRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExtended != oldWidget.isExtended) {
      if (widget.isExtended) {
        _controller.forward().then((_) {
          setState(() {
            _isExtended = true;
          });
        });
      } else {
        setState(() {
          _isExtended = false; // Сразу обновляем состояние
        });
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final NavigationRailLabelType showLabels = NavigationRailLabelType.all;
  final NavigationRailLabelType hideLabels = NavigationRailLabelType.none;

  @override
  Widget build(BuildContext context) {
    return NavRailTransition(
      railWidth: _widthAnimation.value,
      animation: widget.railAnimation,
      backgroundColor: widget.backgroundColor,
      child: NavigationRail(
        selectedIndex: widget.selectedIndex,
        backgroundColor: widget.backgroundColor,
        onDestinationSelected: widget.onDestinationSelected,
        groupAlignment: -0.85,
        extended: _isExtended,
        labelType: _isExtended ? hideLabels : showLabels,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}

// destinations: destinations.map((d) {
//   return NavigationRailDestination(
//     icon: Icon(d.icon),
//     label: AnimatedSwitcher(
//       duration: const Duration(milliseconds: 350),
//       transitionBuilder: (child, animation) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//       child: _isExtended
//           ? Row(
//         mainAxisAlignment: MainAxisAlignment.start, // Выравнивание по левому краю
//         key: ValueKey('${d.label}_row'),
//         mainAxisSize: MainAxisSize.min, // Минимальная ширина
//         children: [
//           Flexible(
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 350),
//               opacity: _showText ? 1.0 : 0.0,
//               child: Text(
//                 d.label,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         ],
//       )
//           : AnimatedOpacity(
//         duration: const Duration(milliseconds: 350),
//         opacity: _showText ? 1.0 : 0.0,
//         child: Text(
//           d.label,
//           key: ValueKey('${d.label}_column'),
//           textAlign: TextAlign.center,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     ),
//   );
// }).toList(),

// leading: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.menu),
//               ),
//             ],
//           ),
// class AppNavRail extends StatelessWidget {
//   const AppNavRail({
//     super.key,
//     required this.railAnimation,
//     required this.backgroundColor,
//     required this.selectedIndex,
//     this.onDestinationSelected,
//   });
//
//   final RailAnimation railAnimation;
//   final Color backgroundColor;
//   final int selectedIndex;
//   final ValueChanged<int>? onDestinationSelected;
//
//   final NavigationRailLabelType labelType = NavigationRailLabelType.all;
//
//   @override
//   Widget build(BuildContext context) {
//     return NavRailTransition(
//       animation: railAnimation,
//       backgroundColor: backgroundColor,
//       child: NavigationRail(
//         selectedIndex: selectedIndex,
//         backgroundColor: backgroundColor,
//         onDestinationSelected: onDestinationSelected,
//         leading: Column(
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.menu),
//             ),
//           ],
//         ),
//         groupAlignment: -0.85,
//         //extended: true,
//         labelType: labelType,
//         destinations: destinations.map((d) {
//           return NavigationRailDestination(
//             icon: Icon(d.icon),
//             label: Text(d.label),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// class AppNavRail extends StatelessWidget {
//   const AppNavRail({
//     super.key,
//     required this.railAnimation,
//     required this.backgroundColor,
//     required this.selectedIndex,
//     this.onDestinationSelected,
//     required this.isExtended,
//   });
//
//   final RailAnimation railAnimation;
//   final Color backgroundColor;
//   final int selectedIndex;
//   final ValueChanged<int>? onDestinationSelected;
//   final bool isExtended;
//
//   final NavigationRailLabelType showLabels = NavigationRailLabelType.all;
//   final NavigationRailLabelType hideLabels = NavigationRailLabelType.none;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return NavRailTransition(
//       animation: railAnimation,
//       backgroundColor: backgroundColor,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200), // Длительность анимации.
//         width: isExtended ? 150 : 72, // Ширина рельсов в расширенном и сжатом состоянии.
//         child: NavigationRail(
//           selectedIndex: selectedIndex,
//           backgroundColor: backgroundColor,
//           onDestinationSelected: onDestinationSelected,
//           groupAlignment: -0.85,
//           extended: isExtended, // Управляем расширением текста.
//           labelType: isExtended ? hideLabels : showLabels,
//           destinations: destinations.map((d) {
//             return NavigationRailDestination(
//               icon: Icon(d.icon),
//               label: Text(d.label),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }