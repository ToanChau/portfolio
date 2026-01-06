import 'base.dart';

enum KycReviewStatus implements BaseEnum{
  init('init'),
  onHold('onHold'),
  pending('pending'),
  completed('completed');

  @override
  final String value;

  const KycReviewStatus(this.value);
}