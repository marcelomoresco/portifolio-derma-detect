import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAtom extends StatelessWidget {
  const DateAtom({
    super.key,
    required this.date,
  });
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginDetail),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(kCornerBig),
      ),
      child: Row(
        children: [
          Text(
            DateFormat("dd/MM/yyyy").format(date),
            style: AppTextStyles.interMedium12.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
