import 'package:flutter/material.dart';

class NavigationBarItemMolecule implements BottomNavigationBarItem {
  const NavigationBarItemMolecule({
    required Widget activeIcon,
    required Widget icon,
    this.backgroundColor,
    this.label,
    this.tooltip,
    this.key,
  })  : _activeIcon = activeIcon,
        _icon = icon;

  @override
  final Key? key;
  final Widget _activeIcon;
  final Widget _icon;

  @override
  Widget get activeIcon => Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
        child: _activeIcon,
      );
  @override
  Widget get icon => Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
        child: _icon,
      );
  @override
  final Color? backgroundColor;
  @override
  final String? label;
  @override
  final String? tooltip;
}
