import 'package:flutter_test/flutter_test.dart';
import 'package:gasto_certo/app/data/models/user_model.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_firebase_auth_service.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      name: 'User',
      email: 'user@gmail.com',
      id: 'a1b2c3d4',
    );
  });

  test(
      'teste signUp success',
      () => () async {
            when(() => mockFirebaseAuthService.signUp(
                  name: 'User',
                  email: 'user@gmail.com',
                  password: 'user123',
                )).thenAnswer((_) async => user);
            final result = await mockFirebaseAuthService.signUp(
              name: 'User',
              email: 'user@gmail.com',
              password: 'user123',
            );
            expect(result, user);
          });
}
