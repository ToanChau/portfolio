import 'base.dart';

enum KycReviewAnswer implements BaseEnum{
  green('GREEN'),
  red('RED');

  @override
  final String value;

  const KycReviewAnswer(this.value);
}