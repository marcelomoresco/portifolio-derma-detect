import 'package:flutter/material.dart';

class DisableWidgetMolecule extends StatelessWidget {
  const DisableWidgetMolecule({
    super.key,
    required this.child,
    this.opacity,
    this.enable = false,
  });
  final Widget child;
  final double? opacity;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enable ? 1 : opacity ?? 0.3,
      child: IgnorePointer(
        ignoring: !enable,
        child: child,
      ),
    );
  }
}
