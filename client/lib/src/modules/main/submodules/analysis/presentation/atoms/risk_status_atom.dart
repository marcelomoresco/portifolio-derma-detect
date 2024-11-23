import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/extensions/string_extension.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';
import 'package:flutter/material.dart';

class RiskStatusAtom extends StatelessWidget {
  const RiskStatusAtom({
    super.key,
    required this.riskStatus,
  });
  final RiskLevel riskStatus;

  // ignore: library_private_types_in_public_api
  _RiskStatusLayoutStyleNew riskStatusLayoutStyle(BuildContext context) {
    switch (riskStatus) {
      case RiskLevel.high:
        return (
          textColor: Colors.white,
          backgroundColor: Colors.yellow,
        );
      case RiskLevel.veryHigh:
        return (
          textColor: Colors.white,
          backgroundColor: Colors.red,
        );
      case RiskLevel.medium:
        return (
          textColor: Colors.white,
          backgroundColor: Colors.orange,
        );
      case RiskLevel.low:
        return (
          textColor: Colors.white,
          backgroundColor: Colors.green,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMarginDetail),
      decoration: BoxDecoration(
        color: riskStatusLayoutStyle(context).backgroundColor,
        borderRadius: BorderRadius.circular(kCornerBig),
      ),
      child: Row(
        children: [
          Text(
            riskStatus.name.toCapitalize(),
            style: AppTextStyles.interMedium12.copyWith(color: riskStatusLayoutStyle(context).textColor),
          ),
        ],
      ),
    );
  }
}

typedef _RiskStatusLayoutStyleNew = ({
  Color textColor,
  Color backgroundColor,
});
