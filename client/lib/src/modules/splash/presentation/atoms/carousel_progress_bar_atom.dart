import 'package:flutter/material.dart';

class CarouselProgressBarAtom extends StatefulWidget {
  const CarouselProgressBarAtom({
    super.key,
    required this.active,
    required this.duration,
    required this.width,
  });
  final bool active;
  final Duration duration;
  final double width;

  @override
  State<CarouselProgressBarAtom> createState() => _CarouselProgressBarAtomState();
}

class _CarouselProgressBarAtomState extends State<CarouselProgressBarAtom> {
  double? percentageWidth = 0;
  bool animate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        animate = true;
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setAnimation() {
    if (!animate) {
      return;
    }
    if (widget.active) {
      final newWidth = widget.width;
      if (newWidth != percentageWidth) {
        setState(() {
          percentageWidth = newWidth;
        });
      }
    } else {
      const newWidth = 0.0;
      if (newWidth != percentageWidth) {
        setState(() {
          percentageWidth = newWidth;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _setAnimation();
    return Container(
      alignment: Alignment.centerLeft,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white.withOpacity(0.3),
      ),
      child: AnimatedContainer(
        duration: widget.active ? widget.duration : const Duration(),
        width: percentageWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
      ),
    );
  }
}
