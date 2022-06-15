import '../utils/logger.dart';

/// Valida el formato de un correo electronico
///
/// Usa expreciones regulares para validar si el formato del correo
/// ingresado es válido
///
String? emailValidator(String? value) {
  logger.v(value);
  if (value != null) {
    if (value.isEmpty) {
      return "Ingrese el correo";
    }
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(value);

    if (!isValid) {
      return "Ingrese un correo válido";
    }
    return null;
  } else {
    return "Ingrese un correo";
  }
}
