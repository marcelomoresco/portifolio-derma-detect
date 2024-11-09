import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

Future<void> showModalError(
  String text, {
  required BuildContext context,
  void Function(String feedbackId)? onSuccess,
  bool enableDrag = true,
  String? document,
  void Function()? onTap,
  String? buttomText,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: enableDrag,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(kMarginDefault),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(kMarginDefault),
        child: Wrap(
          children: <Widget>[
            Center(
              child: Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(kCornerMedium),
                ),
              ),
            ),
            Container(height: kMarginBig),
            Text(
              text,
              style: AppTextStyles.interRegular16.copyWith(color: Colors.black),
            ),
            Container(height: kMarginBig),
            DermaButton(
              text: buttomText ?? "Fechar",
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.black,
            ),
            Container(height: kMarginBig),
          ],
        ),
      );
    },
  );
}
