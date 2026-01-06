import 'base.dart';

enum KycReviewRejectType implements BaseEnum {
  finalType('FINAL'),
  retry('RETRY');

  @override
  final String value;

  const KycReviewRejectType(this.value);
}
