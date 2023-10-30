import 'package:gasto_certo/app/features/sign_in/sign_in_controller.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_controller.dart';
import 'package:gasto_certo/app/services/auth_service.dart';
import 'package:gasto_certo/app/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<IAuthService>(() => FirebaseAuthService());

  getIt.registerFactory<SignInController>(
      () => SignInController(getIt.get<IAuthService>()));
  getIt.registerFactory<SignUpController>(
      () => SignUpController(getIt.get<IAuthService>()));
}
