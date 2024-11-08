import 'package:derma_detect/src/core/components/molecules/disable_widget_molecule.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/entities/menu_tile_entity.dart';
import 'package:flutter/material.dart';

class MenuTileMolecule extends StatelessWidget {
  const MenuTileMolecule({
    super.key,
    required this.menuTileInfoEntity,
    this.optionalWidget,
    this.padding,
  });

  final ProfileTileInfoEntity menuTileInfoEntity;
  final Widget? optionalWidget;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return DisableWidgetMolecule(
      opacity: menuTileInfoEntity.enabled ? 1 : 0.3,
      enable: menuTileInfoEntity.enabled,
      child: InkWell(
        borderRadius: BorderRadius.circular(kMarginDefault),
        onTap: menuTileInfoEntity.onPressed,
        child: Ink(
          padding: const EdgeInsets.all(kMarginDefault),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMarginDefault),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(menuTileInfoEntity.icon),
              const SizedBox(width: kMarginDefault),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuTileInfoEntity.name,
                      style: AppTextStyles.interRegular16.copyWith(
                        color: Colors.black,
                        height: 1.5,
                      ),
                    ),
                    (menuTileInfoEntity.description == null)
                        ? const SizedBox()
                        : Text(
                            menuTileInfoEntity.description!,
                            style: AppTextStyles.interRegular12.copyWith(
                              color: Colors.grey.shade500,
                              height: 1.5,
                            ),
                            softWrap: true,
                          ),
                  ],
                ),
              ),
              (optionalWidget == null) ? const SizedBox() : optionalWidget!,
              //TODO: OptionalWidget to use a NotificationIdicator,
              //as required on Figma, but not implemented yet
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                splashRadius: kMarginDefault,
                onPressed: menuTileInfoEntity.onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
