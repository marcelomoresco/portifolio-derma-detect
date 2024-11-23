import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/const/skin_care.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SkinCareTipsSection extends StatelessWidget {
  const SkinCareTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Dicas de Cuidados com a Pele",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Column(
            children: skinCareTips.map((tip) {
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: kMarginDefault,
                    vertical: kMarginNormal,
                  ),
                  leading: Icon(tip.icon, color: Colors.green.shade200),
                  title: Text(
                    tip.title,
                    style: AppTextStyles.interSemiBold14,
                  ),
                  subtitle: Text(
                    tip.description,
                    style: AppTextStyles.interRegular12,
                  ),
                ),
              );
            }).toList(),
          ),
          const Gap(kMarginDefault)
        ],
      ),
    );
  }
}

class SkinCareTip {
  final String title;
  final String description;
  final IconData icon;

  SkinCareTip({
    required this.title,
    required this.description,
    required this.icon,
  });
}
