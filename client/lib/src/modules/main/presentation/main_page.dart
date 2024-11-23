import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/presentation/cubits/main_cubit.dart';
import 'package:derma_detect/src/modules/main/presentation/templates/main_template.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/pages/analysis_page.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/pages/home_page.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/pages/profile_page.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const routeName = '/main-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends DermaCubitState<MainPage, MainCubit> {
  List<BarItem> get barItems => [
        const BarItem(
          selectedTabIcon: Icon(
            FontAwesomeIcons.house,
            color: Colors.green,
          ),
          unselectedTabIcon: Icon(FontAwesomeIcons.house),
          name: "Home",
          page: HomePage(),
        ),
        const BarItem(
          selectedTabIcon: Icon(
            FontAwesomeIcons.magnifyingGlassChart,
            color: Colors.green,
          ),
          unselectedTabIcon: Icon(FontAwesomeIcons.magnifyingGlassChart),
          name: "Análises",
          page: AnalysisPage(),
        ),
        const BarItem(
          selectedTabIcon: Icon(
            FontAwesomeIcons.user,
            color: Colors.green,
          ),
          unselectedTabIcon: Icon(FontAwesomeIcons.user),
          name: "Perfil",
          page: ProfilePage(),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: cubit,
      builder: (context, state) {
        return MainTemplate(
          barItems: barItems,
          currentIndex: state.currentIndex,
          onTabTap: _onTabTap,
        );
      },
    );
  }

  void _onTabTap(int index) {
    // cubit.setHomeCubit();
    cubit.onTabTap(index, context);
  }
}
