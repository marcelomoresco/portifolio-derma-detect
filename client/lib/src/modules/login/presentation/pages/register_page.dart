import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/login/login_module.dart';
import 'package:derma_detect/src/modules/login/presentation/cubit/register_cubit.dart';
import 'package:derma_detect/src/core/templates/templates/single_field_template.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = '/register-page';
  static const routePath = LoginModule.routePath + routeName;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends DermaCubitState<RegisterPage, RegisterCubit> {
  @override
  Widget build(BuildContext context) {
    return SingleFieldTemplate(
      showBackButton: true,
      onBackButtonTap: cubit.openLogin,
      title: "Registrar",
      subtitle: "Digite seus dados e abra sua conta agora mesmo",
      fieldComponent: const [
        DermaTextField(
          labelText: 'Nome Completo',
          hintText: 'Digite seu nome completo',
          obscureText: true,
        ),
        Gap(kMarginDefault),
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
        Gap(kMarginDefault),
        DermaTextField(
          labelText: 'Confirme a senha',
          hintText: 'Digite sua senha novamente',
          obscureText: true,
        ),
      ],
      buttonMoleculeOld: [
        DermaButton(
          onPressed: cubit.onRegister,
          text: "Registrar",
        ),
        const Gap(kMarginSmall),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: cubit.openLogin,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: context.colors.background),
                children: [
                  TextSpan(
                    text: 'Já tem cadastro? ',
                    style: AppTextStyles.ralewayRegular14,
                  ),
                  TextSpan(
                    text: 'Login',
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
