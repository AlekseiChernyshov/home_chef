import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';

class BrightnessButton extends StatelessWidget {
  const BrightnessButton({
    super.key,
    required this.handleBrightnessChange,
    this.showTooltipBelow = true,
  });

  final void Function(bool useLightMode) handleBrightnessChange;
  final bool showTooltipBelow;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Toggle brightness',
      child: IconButton(
        icon:
        isBright
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () => handleBrightnessChange(!isBright),
      ),
    );
  }
}

class ColorSeedButton extends StatelessWidget {
  const ColorSeedButton({
    super.key,
    required this.handleColorSelect,
    required this.colorSelected,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.palette_outlined),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return ColorSeed.values.map((currentColor) {
          return PopupMenuItem<int>(
            value: ColorSeed.values.indexOf(currentColor),
            enabled: currentColor != colorSelected,
            child: Row(
              children: [
                Icon(
                  currentColor == colorSelected ? Icons.color_lens : Icons.color_lens_outlined,
                  color: currentColor.color,
                ),
                const SizedBox(width: 10),
                Text(currentColor.label),
              ],
            ),
          );
        }).toList();
      },
      onSelected: handleColorSelect,
    );
  }
}


