import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/entities/menu_tile_entity.dart';
import 'package:flutter/material.dart';

class DirectActionTileMolecule extends StatelessWidget {
  const DirectActionTileMolecule({
    super.key,
    required this.menuTileContent,
  });

  final ProfileTileInfoEntity menuTileContent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: menuTileContent.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(kMarginMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(menuTileContent.icon),
            const SizedBox(width: kMarginDefault),
            Text(
              menuTileContent.name,
              style: AppTextStyles.interRegular16.copyWith(
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
