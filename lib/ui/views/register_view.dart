import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:admin_dashboard/services/validation_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:admin_dashboard/ui/inputs/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            color: ColorsCustom.backgroundColor,
            child: Center(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: Provider.of<RegisterFormProvider>(context, listen: false)
                    .formKey,
                child: Column(
                  children: [
                    CustomInput(
                      onFieldSubmitted: () =>
                          onFormSubmit(registerFormProvider, authProvider),
                      onChanged: (value) => registerFormProvider.name = value,
                      validator: (value) =>
                          validationService.nameValidator(value),
                      style: TextStyle(color: ColorsCustom.subtitleColor),
                      decoration: CustomInputDecoration
                          .authPageCustomInputBoxDecoration(
                        hint: 'Nombre',
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onFieldSubmitted: () =>
                          onFormSubmit(registerFormProvider, authProvider),
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) =>
                          validationService.emailValidator(value),
                      style: TextStyle(color: ColorsCustom.subtitleColor),
                      decoration: CustomInputDecoration
                          .authPageCustomInputBoxDecoration(
                        hint: 'Correo',
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onFieldSubmitted: () =>
                          onFormSubmit(registerFormProvider, authProvider),
                      onChanged: (value) =>
                          registerFormProvider.password = value,
                      validator: (value) =>
                          validationService.passwordValidator(value),
                      style: TextStyle(color: ColorsCustom.subtitleColor),
                      obscureText: true,
                      decoration: CustomInputDecoration
                          .authPageCustomInputBoxDecoration(
                        hint: 'Contaseña',
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomOutlinedButton(
                        onPressed: () {
                          onFormSubmit(registerFormProvider, authProvider);
                          // final validForm = registerFormProvider.validateForm();
                          // if (!validForm) return;

                          // //final authProvider =
                          // //    Provider.of<AuthProvider>(context, listen: false);

                          // authProvider.register(
                          //     registerFormProvider.email,
                          //     registerFormProvider.password,
                          //     registerFormProvider.name);
                        },
                        text: 'Crear cuenta'),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
                      },
                      child: const Text(
                        'Ir al login',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }

  void onFormSubmit(
      RegisterFormProvider registerFormProvider, AuthProvider authProvider) {
    final validForm = registerFormProvider.validateForm();
    if (!validForm) return;

    //final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.register(registerFormProvider.email,
        registerFormProvider.password, registerFormProvider.name);
  }
}
