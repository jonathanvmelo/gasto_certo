import 'package:gasto_certo/app/common/services/prefs_service.dart';

class LoginController {
  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future<bool> auth() async {
    if (_login == "Jota" && _pass == "123") {
      PrefsService.save(_login!);
      PrefsService.save(_pass!);
    }
    return false;
  }
}
