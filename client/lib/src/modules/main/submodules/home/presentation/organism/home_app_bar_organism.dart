import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/molecules/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DermaAppBar extends StatelessWidget {
  const DermaAppBar({
    super.key,
    required this.isLoading,
    required this.name,
  });
  final bool isLoading;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return Material(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.25),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(kMarginDefault),
        bottomRight: Radius.circular(kMarginDefault),
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kMarginNormal),
            bottomRight: Radius.circular(kMarginNormal),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: kMarginDefault,
            top: kMarginBig,
            bottom: kMarginSmall,
            right: kMarginSmall,
          ),
          child: Column(
            children: [
              SizedBox(height: safeAreaHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                kCornerPill,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(kMarginSmall),
                          child: const Icon(Icons.person),
                        ),
                        const SizedBox(width: kMarginSmall),
                        Expanded(
                          child: CustomShimmerWidget(
                            loading: isLoading,
                            placeholder: Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(kCornerMedium),
                                  ),
                                ),
                              ],
                            ),
                            child: Text(
                              'Seja bem vindo ${name?.split(' ').first}!',
                              style: AppTextStyles.interSemiBold18.copyWith(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(kMarginSmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
