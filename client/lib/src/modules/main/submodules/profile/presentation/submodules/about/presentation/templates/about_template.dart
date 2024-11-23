import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/core/widgets/templates/loading_template.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/about/presentation/molecules/about_tile_molecule.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../about_strings.dart';

class AboutTemplate extends StatelessWidget {
  const AboutTemplate({
    super.key,
    required this.aboutItemsList,
    required this.status,
  });
  final List<AboutItem> aboutItemsList;
  final Status status;

  @override
  Widget build(BuildContext context) {
    const footerMargin = 76.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text(
          AboutStrings.appBarTitle,
          style: AppTextStyles.interMedium20,
        ),
        leading: InkWell(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: (status != Status.success)
          ? const LoadingTemplate(isAppBarVisible: false)
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(),
                ...aboutItemsList
                    .map(
                      (abouItem) => Padding(
                        padding: const EdgeInsets.all(kMarginDefault),
                        child: AboutItemMolecule(
                          aboutItem: abouItem,
                        ),
                      ),
                    )
                    .expand(_addDivider),
                const SizedBox(height: footerMargin),
              ],
            ),
    );
  }
}

Iterable<Widget> _addDivider(Widget widget) sync* {
  yield widget;

  yield const Divider();
}
