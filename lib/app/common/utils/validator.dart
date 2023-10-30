class Validator {
  Validator._();

  static String? validateName(String? name) {
    final regex = RegExp(r"\b([A-Z]+/*)+");
    if (name != null && name.isEmpty) return "Esse campo deve ser preenchido";
    if (name != null && !name.contains(regex)) return "Nome inálido";

    return null;
  }

  static String? validateEmail(value) {
    final emailRegex = RegExp(r"\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b");
    if (value != null && value.isEmpty) {
      Future.delayed(const Duration(
        seconds: 3,
      ));
      return "Campo obrigatório";
    }
    if (value != null && !emailRegex.hasMatch(value)) return 'Email inválido';
    return null;
  }

  static String? validatePassword(value) {
    // final passwordRegex =
    //     RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Campo senha é obrigatório";
    }
    if (value!.length < 6) {
      return "A senha deve ter de 6 a 12 caractéries";
    }
    // if (value != null && !passwordRegex.hasMatch(value)) {
    //   return 'Senha inálida';
    // }
    return null;
  }

  static String? validatePasswordCompare(String? compareTo) {
    // final passwordRegex =
    // RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (compareTo != null && compareTo.isEmpty) {
      return "Campo obrigatório";
    }
    if (compareTo!.length < 6) {
      return "A senha deve ter de 6 a 12 caractéries";
    }
    // ignore: unnecessary_null_comparison
    // if (compareTo != null && !passwordRegex.hasMatch(compareTo)) {
    //   return 'Senha inálida';
    // }
    return null;
  }
}
