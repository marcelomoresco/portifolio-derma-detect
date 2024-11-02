import 'dart:async';

import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';
import '../molecules/carousel_background_molecule.dart';
import '../molecules/carousel_progress_bar_molecule.dart';

class CarouselOrganism extends StatefulWidget {
  const CarouselOrganism({
    super.key,
    required this.textBottomOffset,
    required this.carouselContent,
  });
  final double textBottomOffset;
  final List<CarouselContent> carouselContent;

  @override
  State<CarouselOrganism> createState() => _CarouselOrganismState();
}

class _CarouselOrganismState extends State<CarouselOrganism> {
  int currentPage = 0;
  final Duration duration = const Duration(seconds: 10);
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  void _setTimer() {
    timer = Timer.periodic(
      duration,
      (timer) {
        setState(() {
          if (currentPage == widget.carouselContent.length - 1) {
            currentPage = 0;
          } else {
            currentPage++;
          }
        });
      },
    );
  }

  void _cancelTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselBackgroundMolecule(
          carouselContent: widget.carouselContent,
          currentPage: currentPage,
          textBottomOffset: widget.textBottomOffset,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kMarginDefault),
            child: CarouselProgressBarMolecule(
              totalPages: widget.carouselContent.length,
              currentPage: currentPage,
              duration: duration,
            ),
          ),
        ),
      ],
    );
  }
}
