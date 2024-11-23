import 'package:flutter/material.dart';

class BackArrowButtonAtom extends StatelessWidget {
  const BackArrowButtonAtom({
    super.key,
    this.onTap,
    this.color = Colors.black,
    this.hasLabel = true,
    this.isLoading = false,
  });

  final void Function()? onTap;
  final Color color;
  final bool hasLabel;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: onTap ?? () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: color,
                    ),
                    if (hasLabel) ...[
                      const SizedBox(width: 4),
                      Text(
                        "Voltar",
                        style: TextStyle(color: color, fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
