import 'package:domain/domain.dart';

enum PaymentMethod implements BaseEnum{
  cash('cash'),
  momo('momo'),
  vnpay('vnpay');

  @override
  final String value;

  const PaymentMethod(this.value);
}