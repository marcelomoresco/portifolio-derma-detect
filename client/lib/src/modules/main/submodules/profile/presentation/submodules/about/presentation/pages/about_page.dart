import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/about/about_module.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/about/presentation/molecules/about_tile_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../about_strings.dart';
import '../cubits/about_cubit.dart';
import '../templates/about_template.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  static const routeName = '/about';
  static const routePath = AboutModule.routePath + routeName;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends DermaCubitState<AboutPage, AboutCubit> {
  @override
  void initState() {
    super.initState();
    cubit.getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      bloc: cubit,
      builder: (context, state) {
        return AboutTemplate(
          status: state.status,
          aboutItemsList: [
            AboutItem(
              icon: FontAwesomeIcons.phone,
              title: AboutStrings.yourDevice,
              subText1: '${AboutStrings.model} ${state.model}',
              subText2: '${AboutStrings.system} ${state.system}',
            ),
            AboutItem(
              icon: Icons.verified_sharp,
              title: AboutStrings.appVersion,
              subText1: '${AboutStrings.version} ${state.version}',
              subText2: '${AboutStrings.build} ${state.build}',
            ),
          ],
        );
      },
    );
  }
}
