typedef StringValidationCallback = String? Function(String? value);

class ValidationBuilder {
  ValidationBuilder({this.optional = false, this.fieldName = ""});

  final bool optional;
  final String fieldName;
  final List<StringValidationCallback> validations = [];

  ValidationBuilder add(StringValidationCallback validation) {
    validations.add(validation);
    return this;
  }

  /// Value must not be null
  ValidationBuilder required([String? message]) =>
      add((v) => v == null || v.isEmpty
          ? message ?? "El campo ${fieldName.toLowerCase()} es requerido"
          : null);

  ValidationBuilder maxLength(int length, [String? message]) => add((v) => v !=
              null &&
          v.length > length
      ? message ??
          "El campo ${fieldName.toLowerCase()} debe tener máximo $length caracteres"
      : null);

  ValidationBuilder minLength(int length, [String? message]) => add((v) => v !=
              null &&
          v.length < length
      ? message ??
          "El campo ${fieldName.toLowerCase()} debe tener mínimo $length caracteres"
      : null);

  ValidationBuilder email([String? message]) => add((v) => v != null &&
          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")
              .hasMatch(v)
      ? message ?? "El campo ${fieldName.toLowerCase()} no es un correo válido"
      : null);

  ValidationBuilder password([String? message]) => add((v) => v != null &&
          !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$").hasMatch(v)
      ? message ?? "Mínimo 8 caracteres, al menos una letra y un número"
      : null);

  ValidationBuilder sameAs(String value, [String? message]) => add((v) => v !=
              null &&
          v != value
      ? message ??
          "El campo ${fieldName.toLowerCase()} debe ser igual al campo $value"
      : null);

  /// Tests [value] against defined [validations]
  String? test(String? value) {
    for (var validate in validations) {
      // Return null if field is optional and value is null
      if (optional && (value == null || value.isEmpty)) {
        return null;
      }

      // Otherwise execute validations
      final result = validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  /// Returns a validator function for FormInput
  StringValidationCallback build() => test;
}
