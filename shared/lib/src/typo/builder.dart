part of 'typo.dart';

class TextBuilderTypo {
  final Set<BaseTypo> typos;
  final Key? key;

  TextBuilderTypo({required this.typos, this.key});

  TextStyle buildTextStyle(BuildContext context) {
    FontWeight? fontWeight;
    FontStyle? fontStyle;
    double? letterSpacing;
    Color? color;
    double? fontSize;
    TextDecoration? textDecoration;
    Color? textDecorationColor;
    TextDecorationStyle? textDecorationStyle;
    double? textDecorationThickness;
    Color? fillColor;
    double? wordSpacing;
    String? fontFamily = Theme.of(context).textTheme.bodyMedium?.fontFamily;
    double? textHeight;
    TextOverflow? overflow;
    Paint? background;
    List<FontFeature>? fontFeatures;
    Paint? foreground;
    List<Shadow>? shadows;
    Locale? locale;
    TextBaseline? textBaseline;

    List<Typo> allTypos = [];
    List<CompositeTypo> compositeTypo = [];

    compositeTypo.addAll(typos
        .toList().whereType<CompositeTypo>()
        .toList());

    if (compositeTypo.isNotEmpty) {
      allTypos = compositeTypo.expand((element) => element.typo).toList();
    }

    allTypos.addAll(typos.whereType<Typo>().toList());

    for (var element in allTypos) {
      if (element is FontWeightTypo) {
        fontWeight = element.fontWeight;
      } else if (element is FontStyleTypo) {
        fontStyle = element.fontStyle;
      } else if (element is LetterSpacingTypo) {
        letterSpacing = element.letterSpacing;
      } else if (element is TextColorTypo) {
        color = element.color;
      } else if (element is FontSizeTypo) {
        fontSize = element.fontSize;
      } else if (element is TextDecorationTypo) {
        textDecoration = element.textDecoration;
      } else if (element is TextDecorationColorTypo) {
        textDecorationColor = element.textDecorationColor;
      } else if (element is TextDecorationStyleTypo) {
        textDecorationStyle = element.textDecorationStyle;
      } else if (element is TextDecorationThicknessTypo) {
        textDecorationThickness = element.textDecorationThickness;
      } else if (element is TextFillColorTypo) {
        fillColor = element.fillColor;
      } else if (element is WordSpacingTypo) {
        wordSpacing = element.wordSpacing;
      } else if (element is FontFamilyTypo) {
        fontFamily = element.fontFamily;
      } else if (element is TextHeightTypo) {
        textHeight = element.textHeight;
      } else if (element is TextOverflowTypo) {
        overflow = element.textOverflow;
      } else if (element is BackgroundTypo) {
        background = element.background;
      } else if (element is FontFeaturesTypo) {
        fontFeatures = element.fontFeatures;
      } else if (element is ForegroundTypo) {
        foreground = element.foreground;
      } else if (element is ShadowsTypo) {
        shadows = element.shadows;
      } else if (element is LocaleTypo) {
        locale = element.locale;
      } else if (element is TextBaselineTypo) {
        textBaseline = element.textBaseline;
      }
    }

    final textStyle = TextStyle(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      color: color,
      fontSize: fontSize,
      decoration: textDecoration,
      decorationColor: color,
      decorationStyle: textDecorationStyle,
      decorationThickness: textDecorationThickness,
      backgroundColor: fillColor,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
      height: textHeight,
      overflow: overflow,
      background: background,
      fontFeatures: fontFeatures,
      foreground: foreground,
      shadows: shadows,
      locale: locale,
      textBaseline: textBaseline,
    );
    return textStyle;
  }

  TextWidgetAttr buildTextWidgetConfig() {
    TextAlign? textAlign;
    int? maxLines;
    bool? softWrap;
    TextDirection? textDirection;
    StrutStyle? strutStyle;
    TextOverflow? overflow;
    Locale? locale;
    TextWidthBasis? textWidthBasis;

    for (var element in typos) {
      if (element is TextAlignTypo) {
        textAlign = element.textAlign;
      } else if (element is MaxLinesTypo) {
        maxLines = element.maxLines;
      } else if (element is SoftWrapTypo) {
        softWrap = element.softWrap;
      } else if (element is TextDirectionTypo) {
        textDirection = element.textDirection;
      } else if (element is StrutStyleTypo) {
        strutStyle = element.strutStyle;
      } else if (element is TextOverflowTypo) {
        overflow = element.textOverflow;
      } else if (element is TextLocaleTypo) {
        locale = element.locale;
      } else if (element is TextWidthBasisTypo) {
        textWidthBasis = element.textWidthBasis;
      }
    }

    return TextWidgetAttr(
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      locale: locale,
      textWidthBasis: textWidthBasis,
    );
  }
}

class TextDecorationStyleBuilder {
  const TextDecorationStyleBuilder();

  TextDecorationStyleTypo get dashed =>
      const TextDecorationStyleTypo.dashed();

  TextDecorationStyleTypo get dotted =>
      const TextDecorationStyleTypo.dotted();

  TextDecorationStyleTypo get double =>
      const TextDecorationStyleTypo.double();

  TextDecorationStyleTypo get solid =>
      const TextDecorationStyleTypo.solid();
}

class TextAlignStyleBuilder {
  const TextAlignStyleBuilder();

  TextAlignTypo get left => const TextAlignTypo.left();

  TextAlignTypo get right => const TextAlignTypo.right();

  TextAlignTypo get center => const TextAlignTypo.center();

  TextAlignTypo get justify => const TextAlignTypo.justify();

  TextAlignTypo get start => const TextAlignTypo.start();

  TextAlignTypo get end => const TextAlignTypo.end();
}

class TextDirectionBuilder {
  const TextDirectionBuilder();

  TextDirectionTypo get ltr => const TextDirectionTypo.ltr();

  TextDirectionTypo get rtl => const TextDirectionTypo.rtl();
}

class TextOverflowBuilder {
  const TextOverflowBuilder();

  TextOverflowTypo get clip => const TextOverflowTypo.clip();

  TextOverflowTypo get ellipsis => const TextOverflowTypo.ellipsis();

  TextOverflowTypo get fade => const TextOverflowTypo.fade();
}

class TyposGn {
  static CompositeTypo get heading1 {
    return const CompositeTypo({
      FontWeightTypo(FontWeight.bold),
      FontSizeTypo(22),
    });
  }
}

class TextWidgetAttr {
  final Key? key;
  final int? maxLines;

  final TextOverflow? overflow;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final Locale? locale;

  final StrutStyle? strutStyle;

  final bool? softWrap;

  final TextWidthBasis? textWidthBasis;

  TextWidgetAttr(
      {this.key,
        this.maxLines,
        this.overflow,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.strutStyle,
        this.softWrap,
        this.textWidthBasis});

  TextWidgetAttr copyWith({
    Key? key,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    StrutStyle? strutStyle,
    bool? softWrap,
    TextWidthBasis? textWidthBasis,
  }) {
    return TextWidgetAttr(
      key: key ?? this.key,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      strutStyle: strutStyle ?? this.strutStyle,
      softWrap: softWrap ?? this.softWrap,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
    );
  }
}

class WordSpaceBuilderStyle {
  const WordSpaceBuilderStyle();

  WordSpacingTypo get small => const WordSpacingTypo(1);
  WordSpacingTypo get medium => const WordSpacingTypo(2);
  WordSpacingTypo value(double value) => WordSpacingTypo(value);
}

