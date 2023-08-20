import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/colors_custom.dart';
import 'package:admin_dashboard/services/validation_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:admin_dashboard/ui/inputs/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 5,
          ),
          color: ColorsCustom.backgroundColor,
          child: Center(
              child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: loginFormProvider.formKey,
              child: Column(
                children: [
                  CustomInput(
                    validator: (value) =>
                        validationService.emailValidator(value),
                    onChanged: (value) => loginFormProvider.email = value,
                    style: TextStyle(color: ColorsCustom.subtitleColor),
                    decoration:
                        CustomInputDecoration.authPageCustomInputBoxDecoration(
                      hint: 'Ingrese su correo',
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomInput(
                    onChanged: (value) => loginFormProvider.password = value,
                    validator: (value) =>
                        validationService.passwordValidator(value),
                    style: TextStyle(color: ColorsCustom.subtitleColor),
                    decoration:
                        CustomInputDecoration.authPageCustomInputBoxDecoration(
                            hint: 'Contraseña'),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomOutlinedButton(
                      onPressed: () {
                        final isValid = loginFormProvider.validateForm();

                        if (isValid) {
                          authProvider.login(loginFormProvider.email,
                              loginFormProvider.password);
                        }
                      },
                      text: 'Ingresar'),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Flurorouter.registerRoute);
                    },
                    child: const Text(
                      'Nueva Cuenta',
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
      }),
    );
  }
}
