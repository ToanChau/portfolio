import 'package:domain/domain.dart';

enum ProductType implements BaseEnum {
  single('single'),
  variant('variant');

  @override
  final String value;

  @override
  const ProductType(this.value);
}
