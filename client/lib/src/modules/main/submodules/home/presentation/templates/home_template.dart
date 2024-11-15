// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/core/widgets/molecules/derma_card.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:derma_detect/src/modules/main/submodules/home/home_strings.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/const/faq_home_app.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/molecules/image_banner_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/home_app_bar_organism.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/home_faq_organism.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/home_profile_organism.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/organism/skin_care_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({
    super.key,
    this.dermaUser,
    required this.onRefresh,
    required this.userStatus,
    required this.onTapFaqCategory,
  });
  final DermaUser? dermaUser;
  final Future<void> Function() onRefresh;
  final Status userStatus;
  final void Function(FaqCategory) onTapFaqCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
          child: Column(
            children: [
              Center(
                child: DermaAppBar(
                  isLoading: userStatus == Status.loading,
                  name: dermaUser?.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kMarginDefault),
                child: Column(
                  children: [
                    DermaCard(
                      icon: const Icon(
                        Icons.warning,
                        color: Colors.orange,
                        size: 24,
                      ),
                      title: "Estamos em fase beta!",
                      description: "Ajude-nos a melhorar e participe do app!",
                      onTap: () {},
                    ),
                    const Gap(kMarginDefault),
                    const HomeProfileOrganism(
                      isAnalysisAvailable: true,
                      isLoading: false,
                      analysisQuantity: 5,
                    ),
                    const Gap(kMarginDefault),
                    ImageBannerMolecule(
                      onTap: () {},
                      assetName: AppAssets.banner2,
                      height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
                    ),
                    const Gap(kMarginDefault),
                    const SkinCareTipsSection(),
                    ImageBannerMolecule(
                      onTap: () {},
                      assetName: AppAssets.homeBanner,
                      height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
                    ),
                    const Gap(kMarginDefault),
                    HomeFaqOrganism(
                      title: HomeStrings.faqTitle,
                      description: HomeStrings.faqDescription,
                      onTapFaqCategory: onTapFaqCategory,
                      faqCategories: faqCategoriesHome,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
