import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/core/utils/show_modal.dart';
import 'package:derma_detect/src/core/utils/validators.dart';
import 'package:derma_detect/src/modules/auth/login_module.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/register_cubit.dart';
import 'package:derma_detect/src/core/widgets/templates/single_field_template.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/register_state.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<RegisterCubit, RegisterState>(
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
          showBackButton: true,
          onBackButtonTap: cubit.openLogin,
          title: "Registrar",
          subtitle: "Digite seus dados e abra sua conta agora mesmo",
          fieldComponent: [
            DermaTextField(
              labelText: 'Nome Completo',
              hintText: 'Digite seu nome completo',
              onChanged: (value) => cubit.onFieldChanged(name: value),
            ),
            const Gap(kMarginDefault),
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
            const Gap(kMarginDefault),
            DermaTextField(
              labelText: 'Confirme a senha',
              hintText: 'Digite sua senha novamente',
              obscureText: state.showPassword,
              validator: (value) => Validators.passwordValidator(value),
              onChanged: (value) => cubit.onFieldChanged(confirmPassword: value),
              suffixIcon: state.showPassword ? Icons.visibility_off : Icons.visibility,
              onPressedSuffix: cubit.toggleShowPassword,
            ),
          ],
          buttonMoleculeOld: [
            DermaButton(
              onPressed: cubit.onRegister,
              text: "Registrar",
              isEnable: state.isContinueButtonEnabled,
              isLoading: state.isContinueButtonLoading,
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
      },
    );
  }
}
