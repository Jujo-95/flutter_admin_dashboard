import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/validation_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
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
            color: Colors.black,
            child: Center(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => registerFormProvider.name = value,
                      validator: (value) =>
                          validationService.nameValidator(value),
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputDecoration
                          .authPageCustomInputBoxDecoration(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                        icon: Icons.text_fields,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      onChanged: (value) => registerFormProvider.email = value,
                      validator: (value) =>
                          validationService.emailValidator(value),
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputDecoration
                          .authPageCustomInputBoxDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      onChanged: (value) =>
                          registerFormProvider.password = value,
                      validator: (value) =>
                          validationService.passwordValidator(value),
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputDecoration
                          .authPageCustomInputBoxDecoration(
                        hint: '**********',
                        label: 'Contraseña',
                        icon: Icons.password_outlined,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomOutlinedButton(
                        onPressed: () {
                          registerFormProvider.validateForm();
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
}
