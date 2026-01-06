import 'package:domain/domain.dart';

enum PaymentStatus implements BaseEnum{
  unpaid('unpaid'),
  paid('paid'),
  refunded('refunded');

  @override
  final String value;

  const PaymentStatus(this.value);
}
