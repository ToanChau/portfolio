import 'package:domain/domain.dart';

enum UserRole implements BaseEnum {
  unverifiedCustomer("Unverified Customer"),
  verifiedCustomer("Verified Customer");

  @override
  final String value;

  const UserRole(this.value);
}
