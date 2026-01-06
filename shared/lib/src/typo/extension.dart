part of 'typo.dart';

extension ExtendTypoTextExt on String {
  TypoWidget typo(Set<BaseTypo> typos) {
    return TypoWidget(typos: typos, text: this);
  }

  TextSpan typoSpan(Set<BaseTypo> typos, {required BuildContext context}) {
    final typo = TextBuilderTypo(typos: typos);
    final config = typo.buildTextWidgetConfig();
    return TextSpan(
      text: this,
      style: typo.buildTextStyle(context),
      locale: config.locale,
    );
  }
}