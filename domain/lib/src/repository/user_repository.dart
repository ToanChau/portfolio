import 'package:domain/domain.dart';

abstract class UserRepository {
  Future<Result<AuthenticationModel>> signInToken({
    required String token,
    required String provider,
  });

  Future<Result<AuthenticationModel>> signInWithGoogle();

  Future<Result<UserModel>> getMe();

  Future<Result<OtpRequestModel>> requestOtp({
    required String phoneNumber,
    required String dialCode,
    required OtpOperation operation,
  });

  Future<Result<OtpVerificationModel>> verifyOtp({
    required String code,
    required OtpOperation operation,
  });

  Future<void> signOut();

  Future<bool> jwtExpired();

  Future<String?> getToken();

  Future<bool> skippedOnboarding();

  void skipOnboarding();
}
