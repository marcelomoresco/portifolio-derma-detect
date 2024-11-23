import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/core/widgets/organisms/modal_organism.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/onboarding_new_analysis_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/organism/modal_permission_organism.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/templates/onboarding_new_analysis_template.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OnboardingNewAnalysisPage extends StatefulWidget {
  const OnboardingNewAnalysisPage({super.key});
  static const routeName = '/onboarding-new-analysis';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<OnboardingNewAnalysisPage> createState() => _OnboardingNewAnalysisPageState();
}

class _OnboardingNewAnalysisPageState extends DermaCubitState<OnboardingNewAnalysisPage, OnboardingNewAnalysisCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingNewAnalysisCubit, OnboardingNewAnalysisState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.showModalPermission) {
          _openModalPermission();
        }
      },
      listenWhen: (previous, current) => previous.showModalPermission != current.showModalPermission,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 80,
            backgroundColor: context.colors.primary,
            centerTitle: true,
            title: Text(
              "Começe agora mesmo",
              style: AppTextStyles.interMedium20,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(kMarginSmall),
                bottomRight: Radius.circular(kMarginSmall),
              ),
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
          body: OnboardingNewAnalysisTemplate(
            onTapStarted: _openModalSelectPhoto,
          ),
        );
      },
    );
  }

  Future<void> _openModalPermission() async {
    await showDialog(
      context: context,
      builder: (context) => ModalPermissionOrganism(
        isPopModalAllowed: false,
        title: "Permissão necessária",
        description: "Você precisa permitir acesso à câmera para escanear o problema",
        onTapFirstButtonOnClick: cubit.closeModal,
        onTapCloseModalPermission: cubit.closeModal,
      ),
    );
  }

  Future<void> _openModalSelectPhoto() async {
    await showDialog(
      context: context,
      builder: (context) {
        return ModalOrganism(
          isPopModalAllowed: false,
          icon: FontAwesomeIcons.camera,
          iconSize: 36,
          title: "Anexar imagem",
          description: "Escolha qual das opções você quer escolher para sua análise",
          firstButtonTitle: "Câmera",
          firstButtonOnClick: () async {
            cubit.onTapCamera();
          },
          firstButtonIsOutlined: true,
          secondButtonOnClick: () {
            cubit.onTapGallery();
          },
          secondButtonTitle: "Galeria",
        );
      },
    );
  }
}
