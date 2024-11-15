import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DermaCard extends StatelessWidget {
  const DermaCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });
  final Widget icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(kMarginSmall),
        child: Ink(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(kMarginSmall),
          ),
          padding: const EdgeInsets.all(kMarginDefault),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const Gap(kMarginSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: AppTextStyles.interSemiBold14,
                      ),
                      SizedBox(
                        width: 160,
                        child: Text(
                          description,
                          maxLines: 2,
                          style: AppTextStyles.interRegular12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Gap(kMarginSmall),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}
