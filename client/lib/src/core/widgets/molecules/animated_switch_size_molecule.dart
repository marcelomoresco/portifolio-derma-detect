import 'package:derma_detect/src/core/widgets/molecules/conditional_parent_molecules.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherSize extends StatelessWidget {
  const AnimatedSwitcherSize({
    super.key,
    required this.duration,
    required this.child,
    this.hasSizeAnimation = true,
    this.lazySizeAnimation = true,
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    this.sizeCurve = Curves.linear,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder,
    this.alignment = Alignment.center,
    this.clipBehavior = Clip.hardEdge,
    this.axis,
  });

  final Duration duration;
  final Duration? reverseDuration;
  final bool hasSizeAnimation;

  final bool lazySizeAnimation;
  final Widget child;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final Curve sizeCurve;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder? layoutBuilder;
  final AlignmentGeometry alignment;
  final Clip clipBehavior;

  final Axis? axis;

  Widget defaultLayoutBuilder(
    Widget? currentChild,
    List<Widget> previousChildren,
  ) {
    return ConditionalParentMolecule(
      condition: lazySizeAnimation && hasSizeAnimation,
      conditionalBuilder: (child) {
        return AnimatedSize(
          duration: duration,
          reverseDuration: reverseDuration,
          alignment: alignment,
          clipBehavior: clipBehavior,
          curve: sizeCurve,
          child: child,
        );
      },
      child: Stack(
        alignment: alignment,
        children: <Widget>[
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConditionalParentMolecule(
      condition: !lazySizeAnimation && hasSizeAnimation,
      conditionalBuilder: (child) {
        final size = MediaQuery.sizeOf(context);
        final alignment = this.alignment;

        return Stack(
          clipBehavior: clipBehavior,
          children: [
            AnimatedSize(
              duration: duration,
              reverseDuration: reverseDuration,
              curve: sizeCurve,
              child: Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: this.child,
              ),
            ),
            Positioned(
              left: axis == Axis.vertical || (alignment is Alignment && alignment.x < 0) ? 0 : -size.width,
              right: axis == Axis.vertical || (alignment is Alignment && alignment.x > 0) ? 0 : -size.width,
              top: axis == Axis.horizontal || (alignment is Alignment && alignment.y < 0) ? 0 : -size.height,
              bottom: axis == Axis.horizontal || (alignment is Alignment && alignment.y > 0) ? 0 : -size.height,
              child: child,
            ),
          ],
        );
      },
      child: AnimatedSwitcher(
        duration: duration,
        reverseDuration: reverseDuration,
        switchInCurve: switchInCurve,
        switchOutCurve: switchOutCurve,
        transitionBuilder: transitionBuilder,
        layoutBuilder: layoutBuilder ?? defaultLayoutBuilder,
        child: child,
      ),
    );
  }
}
