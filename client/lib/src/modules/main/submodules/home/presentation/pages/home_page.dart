import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/cubits/home_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/home/presentation/templates/home_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends DermaCubitState<HomePage, HomeCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: HomeTemplate(
            dermaUser: state.dermaUser,
            onRefresh: cubit.onRefresh,
            userStatus: state.userStatus,
            onTapFaqCategory: cubit.onTapFaqCategory,
            onTapQuestion: cubit.onTapQuestion,
          ),
        );
      },
    );
  }
}
