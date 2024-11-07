import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/login_cubit.dart';
import 'package:derma_detect/src/core/templates/templates/single_field_template.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/login-page';
  static const routePath = LoginModule.routePath + routeName;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends DermaCubitState<LoginPage, LoginCubit> {
  @override
  Widget build(BuildContext context) {
    return SingleFieldTemplate(
      showBackButton: false,
      title: "Entrar",
      subtitle: "Digite seus dados",
      fieldComponent: const [
        DermaTextField(
          labelText: 'E-mail',
          hintText: 'Digite seu e-mail',
        ),
        Gap(kMarginDefault),
        DermaTextField(
          labelText: 'Senha',
          hintText: 'Digite sua senha',
          obscureText: true,
        ),
      ],
      buttonMoleculeOld: [
        DermaButton(
          onPressed: cubit.onLoginTap,
          text: "Continuar",
        ),
        const Gap(kMarginSmall),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: cubit.onRegisterTap,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: context.colors.background),
                children: [
                  TextSpan(
                    text: 'Ainda não tem cadastro? ',
                    style: AppTextStyles.ralewayRegular14,
                  ),
                  TextSpan(
                    text: 'Cadastre-se',
                    style: AppTextStyles.ralewayBold14,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
