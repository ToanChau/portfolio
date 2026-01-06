import 'package:flutter/material.dart';
import 'package:shared/src/theme/typo/typo.dart';

part 'extension.dart';

part 'builder.dart';

part 'typos.dart';

abstract class BaseTypo {
  const BaseTypo();
}

class CompositeTypo extends BaseTypo {
  final Set<Typo> typo;

  const CompositeTypo(this.typo);
}

class Typo<T> extends BaseTypo {
  const Typo();

  static FontWeightTypo get bold => const FontWeightTypo(FontWeight.bold);

  static FontWeightTypo get w100 => const FontWeightTypo(FontWeight.w100);

  static FontWeightTypo get w200 => const FontWeightTypo(FontWeight.w200);

  static FontWeightTypo get w300 => const FontWeightTypo(FontWeight.w300);

  static FontWeightTypo get w400 => const FontWeightTypo(FontWeight.w400);

  static FontWeightTypo get w500 => const FontWeightTypo(FontWeight.w500);

  static FontWeightTypo get w600 => const FontWeightTypo(FontWeight.w600);

  static FontWeightTypo get w700 => const FontWeightTypo(FontWeight.w700);

  static FontWeightTypo get w800 => const FontWeightTypo(FontWeight.w800);

  static FontWeightTypo get w900 => const FontWeightTypo(FontWeight.w900);

  static FontWeightTypo get wNormal => const FontWeightTypo(FontWeight.normal);

  static FontWeightTypo get wBold => const FontWeightTypo(FontWeight.bold);

  static FontWeightTypo get wLight => const FontWeightTypo(FontWeight.w300);

  static FontStyleTypo get italic => const FontStyleTypo(FontStyle.italic);

  static FontStyleTypo get normal => const FontStyleTypo(FontStyle.normal);

  static TextDecorationTypo get lineThrough =>
      const TextDecorationTypo(TextDecoration.lineThrough);

  static TextDecorationTypo get overline =>
      const TextDecorationTypo(TextDecoration.overline);

  static TextDecorationTypo get underline =>
      const TextDecorationTypo(TextDecoration.underline);

  static WordSpaceBuilderStyle get wordSpacing => const WordSpaceBuilderStyle();

  static BackgroundTypo background(Paint paint) => BackgroundTypo(paint);

  static FontFeaturesTypo fontFeatures(List<FontFeature> fontFeatures) =>
      FontFeaturesTypo(fontFeatures);

  static TextColorTypo color(Color color) => TextColorTypo(color);

  static TextFillColorTypo fillColor(Color color) => TextFillColorTypo(color);

  static FontSizeTypo size(double fontSize) => FontSizeTypo(fontSize);

  static TextDecorationStyleBuilder get decorate =>
      const TextDecorationStyleBuilder();

  /// Text attributes
  static TextOverflowTypo get clip => const TextOverflowTypo(TextOverflow.clip);

  static TextOverflowTypo get ellipsis =>
      const TextOverflowTypo(TextOverflow.ellipsis);

  static TextOverflowTypo get fade => const TextOverflowTypo(TextOverflow.fade);

  static TextOverflowTypo get visible =>
      const TextOverflowTypo(TextOverflow.visible);

  static TextAlignStyleBuilder get align => const TextAlignStyleBuilder();

  static TextDirectionBuilder get direction => const TextDirectionBuilder();

  static MaxLinesTypo maxLines(int maxLines) => MaxLinesTypo(maxLines);

  static SoftWrapTypo softWrap(bool softWrap) => SoftWrapTypo(softWrap);

  static StrutStyleTypo strut(StrutStyle strutStyle) =>
      StrutStyleTypo(strutStyle);

  static TextOverflowBuilder get overflow => const TextOverflowBuilder();

  static TextLocaleTypo textLocale(Locale locale) => TextLocaleTypo(locale);

  static TextBaselineTypo textBaseline(TextBaseline textBaseline) =>
      TextBaselineTypo(textBaseline);

  static TextHeightTypo height(double tHeight) => TextHeightTypo(tHeight);
}

class TypoStyle {
  TypoStyle._();

  static TextStyle of(BuildContext context, Set<BaseTypo> typos) {
    final builder = TextBuilderTypo(typos: typos);
    return builder.buildTextStyle(context);
  }
}

class TypoWidget extends StatelessWidget {
  final Set<BaseTypo> typos;
  final String text;

  const TypoWidget({super.key, required this.typos, required this.text});

  @override
  Widget build(BuildContext context) {
    final typo = TextBuilderTypo(typos: typos);
    final config = typo.buildTextWidgetConfig();
    return SelectionContainer.disabled(
      child: Text(
        key: config.key,
        text,
        style: typo.buildTextStyle(context),
        textAlign: config.textAlign,
        maxLines: config.maxLines,
        overflow: config.overflow,
        softWrap: config.softWrap,
        locale: config.locale,
        strutStyle: config.strutStyle,
        textDirection: config.textDirection,
        textWidthBasis: config.textWidthBasis,
      ),
    );
  }
}

class TextAlignTypo extends Typo<TextAlign> {
  final TextAlign textAlign;

  // ignore: unused_element
  const TextAlignTypo._(this.textAlign);

  const TextAlignTypo.left() : textAlign = TextAlign.left;

  const TextAlignTypo.right() : textAlign = TextAlign.right;

  const TextAlignTypo.center() : textAlign = TextAlign.center;

  const TextAlignTypo.justify() : textAlign = TextAlign.justify;

  const TextAlignTypo.start() : textAlign = TextAlign.start;

  const TextAlignTypo.end() : textAlign = TextAlign.end;
}

class MaxLinesTypo extends Typo<int> {
  final int maxLines;

  const MaxLinesTypo(this.maxLines);
}

class TextOverflowTypo extends Typo<TextOverflow> {
  final TextOverflow textOverflow;

  const TextOverflowTypo(this.textOverflow);

  const TextOverflowTypo.clip() : textOverflow = TextOverflow.clip;

  const TextOverflowTypo.ellipsis() : textOverflow = TextOverflow.ellipsis;

  const TextOverflowTypo.fade() : textOverflow = TextOverflow.fade;
}

class SoftWrapTypo extends Typo<bool> {
  final bool softWrap;

  const SoftWrapTypo(this.softWrap);
}

class TextDirectionTypo extends Typo<TextDirection> {
  final TextDirection textDirection;

  // ignore: unused_element
  const TextDirectionTypo._(this.textDirection);

  const TextDirectionTypo.ltr() : textDirection = TextDirection.ltr;

  const TextDirectionTypo.rtl() : textDirection = TextDirection.rtl;
}

class StrutStyleTypo extends Typo<StrutStyle> {
  final StrutStyle strutStyle;

  const StrutStyleTypo(this.strutStyle);
}

class TextLocaleTypo extends Typo<Locale> {
  final Locale locale;

  TextLocaleTypo(this.locale);
}

class TextWidthBasisTypo extends Typo<TextWidthBasis> {
  final TextWidthBasis textWidthBasis;

  TextWidthBasisTypo(this.textWidthBasis);
}

class FontWeightTypo extends Typo<FontWeight> {
  final FontWeight fontWeight;

  const FontWeightTypo(this.fontWeight);
}

class FontStyleTypo extends Typo<FontStyle> {
  final FontStyle fontStyle;

  const FontStyleTypo(this.fontStyle);
}

class LetterSpacingTypo extends Typo<double> {
  final double letterSpacing;

  const LetterSpacingTypo(this.letterSpacing);
}

class TextColorTypo extends Typo<Color> {
  final Color color;

  const TextColorTypo(this.color);
}

class FontSizeTypo extends Typo<double> {
  final double fontSize;

  const FontSizeTypo(this.fontSize);
}

class TextDecorationTypo extends Typo<TextDecoration> {
  final TextDecoration textDecoration;

  const TextDecorationTypo(this.textDecoration);
}

class TextDecorationColorTypo extends Typo<Color> {
  final Color textDecorationColor;

  const TextDecorationColorTypo(this.textDecorationColor);
}

class TextDecorationStyleTypo extends Typo<TextDecorationStyle> {
  final TextDecorationStyle textDecorationStyle;

  // ignore: unused_element
  const TextDecorationStyleTypo._(this.textDecorationStyle);

  const TextDecorationStyleTypo.dashed()
      : textDecorationStyle = TextDecorationStyle.dashed;

  const TextDecorationStyleTypo.dotted()
      : textDecorationStyle = TextDecorationStyle.dotted;

  const TextDecorationStyleTypo.double()
      : textDecorationStyle = TextDecorationStyle.double;

  const TextDecorationStyleTypo.solid()
      : textDecorationStyle = TextDecorationStyle.solid;
}

class TextDecorationThicknessTypo extends Typo<double> {
  final double textDecorationThickness;

  const TextDecorationThicknessTypo(this.textDecorationThickness);
}

class TextFillColorTypo extends Typo<Color> {
  final Color fillColor;

  const TextFillColorTypo(this.fillColor);
}

class WordSpacingTypo extends Typo<double> {
  final double wordSpacing;

  const WordSpacingTypo(this.wordSpacing);
}

class FontFamilyTypo extends Typo<String> {
  final String fontFamily;

  const FontFamilyTypo(this.fontFamily);
}

class TextHeightTypo extends Typo<double> {
  final double textHeight;

  const TextHeightTypo(this.textHeight);
}

class BackgroundTypo extends Typo<Paint> {
  final Paint background;

  const BackgroundTypo(this.background);
}

class FontFeaturesTypo extends Typo<List<FontFeature>> {
  final List<FontFeature> fontFeatures;

  const FontFeaturesTypo(this.fontFeatures);
}

class ForegroundTypo extends Typo<Paint> {
  final Paint foreground;

  ForegroundTypo(this.foreground);
}

class ShadowsTypo extends Typo<List<Shadow>> {
  final List<Shadow> shadows;

  ShadowsTypo(this.shadows);
}

class LocaleTypo extends Typo<Locale> {
  final Locale locale;

  LocaleTypo(this.locale);
}

class TextBaselineTypo extends Typo<TextBaseline> {
  final TextBaseline textBaseline;

  TextBaselineTypo(this.textBaseline);
}
