import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
    required this.loading,
    required this.child,
    this.placeholder,
  });

  final bool loading;
  final Widget child;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Shimmer.fromColors(
        baseColor: const Color(0xFFEBEBEB),
        highlightColor: const Color(0xFFFDFDFD),
        child: placeholder ?? child,
      );
    }
    return child;
  }
}
