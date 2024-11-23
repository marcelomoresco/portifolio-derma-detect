import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/core/utils/show_modal.dart';
import 'package:derma_detect/src/core/utils/validators.dart';
import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/login_cubit.dart';
import 'package:derma_detect/src/core/widgets/templates/single_field_template.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/login_state.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.failure != null) {
          if (state.failure?.exception is ClientException) {
            final exception = state.failure?.exception as ClientException;
            showModalError(exception.message, context: context);
          } else {
            showModalError("Algo deu errado", context: context);
          }
        }
      },
      listenWhen: (previous, current) => previous.failure != current.failure,
      builder: (context, state) {
        return SingleFieldTemplate(
          showBackButton: false,
          title: "Entrar",
          subtitle: "Digite seus dados",
          fieldComponent: [
            DermaTextField(
              labelText: 'E-mail',
              hintText: 'Digite seu e-mail',
              validator: (value) => Validators.emailValidator(value),
              onChanged: (value) => cubit.onFieldChanged(email: value),
            ),
            const Gap(kMarginDefault),
            DermaTextField(
              labelText: 'Senha',
              hintText: 'Digite sua senha',
              obscureText: state.showPassword,
              validator: (value) => Validators.passwordValidator(value),
              onChanged: (value) => cubit.onFieldChanged(password: value),
              suffixIcon: state.showPassword ? Icons.visibility_off : Icons.visibility,
              onPressedSuffix: cubit.toggleShowPassword,
            ),
          ],
          buttonMoleculeOld: [
            DermaButton(
              onPressed: cubit.onLoginTap,
              text: "Continuar",
              isEnable: state.isContinueButtonEnabled,
              isLoading: state.isContinueButtonLoading,
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
      },
    );
  }
}
