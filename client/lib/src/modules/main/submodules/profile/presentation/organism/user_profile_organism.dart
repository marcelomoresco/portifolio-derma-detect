import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileOrganism extends StatelessWidget {
  const UserProfileOrganism({
    super.key,
    required this.username,
    required this.email,
  });
  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 54,
              color: Colors.black,
            ),
          ],
        ),
        const Gap(kMarginSmall),
        Text(
          "Olá $username!",
          style: AppTextStyles.interBold20,
        ),
        const Gap(kMarginSmall),
        Text(
          "E-mail: $email",
          style: AppTextStyles.interRegular16,
        ),
      ],
    );
  }
}
