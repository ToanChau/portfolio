import 'package:domain/domain.dart';

enum BookingStatus implements BaseEnum {
  pending("PENDING"),
  confirmed("CONFIRMED"),
  preparing("PREPARING"),
  ready("READY"),
  inProgress("IN_PROGRESS"),
  cancelled("CANCELLED"),
  completed("COMPLETED");

  @override
  final String value;

  const BookingStatus(this.value);
}
