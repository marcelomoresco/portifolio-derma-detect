import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/entities/menu_tile_entity.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/molecule/directive_action_tile_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/molecule/menu_tile_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/organism/user_profile_organism.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class ProfileTemplate extends StatelessWidget {
  const ProfileTemplate({
    super.key,
    required this.directActionTileContent,
    required this.menuListContent,
  });
  final ProfileTileInfoEntity directActionTileContent;
  final List<ProfileTileInfoEntity> menuListContent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kMarginBig),
              const UserProfileOrganism(
                username: "Marcelo",
                email: "marcelomoresco0@gmail.com",
              ),
              const Gap(kMarginDefault),
              ...menuListContent.map(
                (menuTileInfoEntity) => Column(
                  children: [
                    MenuTileMolecule(
                      menuTileInfoEntity: menuTileInfoEntity,
                    ),
                    const Gap(kMarginDefault),
                  ],
                ),
              ),
              DirectActionTileMolecule(
                menuTileContent: directActionTileContent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
