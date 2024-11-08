import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';

mixin ShowModal on Widget {
  Future<T?> showModal<T>({
    required BuildContext context,
    bool useSafeArea = true,
    bool barrierDismissible = true,
  }) async {
    return showDialog<T>(
      context: context,
      useSafeArea: useSafeArea,
      barrierDismissible: barrierDismissible,
      builder: (context) => this,
    );
  }
}

mixin ShowBottomSheet on Widget {
  void showBottomSheet({
    required BuildContext context,
    bool useSafeArea = true,
    bool barrierDismissible = true,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(kMarginDefault)),
      ),
      useSafeArea: useSafeArea,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: this,
      ),
    );
  }
}
