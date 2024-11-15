import 'package:flutter/material.dart';

class ExpandedUnboundedConstraintScrollMolecule extends StatelessWidget {
  const ExpandedUnboundedConstraintScrollMolecule({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
