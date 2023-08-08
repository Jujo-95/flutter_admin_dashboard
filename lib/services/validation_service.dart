class validationService {
  static emailValidator(value) {
    if (value!.isEmpty) return 'Ingrese un una direccion de correo';
    if (value.indexOf(RegExp(r"^[^@]+@[^@]+\.[a-zA-Z]{2,}$")) == -1)
      return 'Ingrese una direccion de correo electrónico válido';
    return null;
  }

  static passwordValidator(value) {
    if (value!.isEmpty) return 'Ingrese una contraseña';
    if (value.length < 6) return 'La contraseña debe ser mayor a 6 dígitos';
    return null;
  }

  static nameValidator(value) {
    if (value!.indexOf(RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+")) == -1) {
      return 'El nombre tiene caracteres inválidos';
    }
  }
}
