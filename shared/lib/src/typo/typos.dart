part of 'typo.dart';

extension TypoExtension on BuildContext {
  CompositeTypo get heading1Light => _Typos.heading1Light(this);
  CompositeTypo get heading1Regular => _Typos.heading1Regular(this);
  CompositeTypo get heading1Medium => _Typos.heading1Medium(this);
  CompositeTypo get heading1Semibold => _Typos.heading1SemiBold(this);

  CompositeTypo get heading2Light => _Typos.heading2Light(this);
  CompositeTypo get heading2Regular => _Typos.heading2Regular(this);
  CompositeTypo get heading2Medium => _Typos.heading2Medium(this);
  CompositeTypo get heading2Semibold => _Typos.heading2SemiBold(this);

  CompositeTypo get heading3Light => _Typos.heading3Light(this);
  CompositeTypo get heading3Regular => _Typos.heading3Regular(this);
  CompositeTypo get heading3Medium => _Typos.heading3Medium(this);
  CompositeTypo get heading3Semibold => _Typos.heading3SemiBold(this);

  CompositeTypo get heading4Light => _Typos.heading4Light(this);
  CompositeTypo get heading4Regular => _Typos.heading4Regular(this);
  CompositeTypo get heading4Medium => _Typos.heading4Medium(this);
  CompositeTypo get heading4Semibold => _Typos.heading4SemiBold(this);

  CompositeTypo get heading5Light => _Typos.heading5Light(this);
  CompositeTypo get heading5Regular => _Typos.heading5Regular(this);
  CompositeTypo get heading5Medium => _Typos.heading5Medium(this);
  CompositeTypo get heading5Semibold => _Typos.heading5SemiBold(this);

  CompositeTypo get heading6Light => _Typos.heading6Light(this);
  CompositeTypo get heading6Regular => _Typos.heading6Regular(this);
  CompositeTypo get heading6Medium => _Typos.heading6Medium(this);
  CompositeTypo get heading6Semibold => _Typos.heading6SemiBold(this);

  CompositeTypo get paragraph1Light => _Typos.paragraph1Light(this);
  CompositeTypo get paragraph1Regular => _Typos.paragraph1Regular(this);
  CompositeTypo get paragraph1Medium => _Typos.paragraph1Medium(this);
  CompositeTypo get paragraph1Semibold => _Typos.paragraph1SemiBold(this);

  CompositeTypo get paragraph2Light => _Typos.paragraph2Light(this);
  CompositeTypo get paragraph2Regular => _Typos.paragraph2Regular(this);
  CompositeTypo get paragraph2Medium => _Typos.paragraph2Medium(this);
  CompositeTypo get paragraph2Semibold => _Typos.paragraph2SemiBold(this);

  CompositeTypo get caption1Light => _Typos.caption1Light(this);
  CompositeTypo get caption1Regular => _Typos.caption1Regular(this);
  CompositeTypo get caption1Medium => _Typos.caption1Medium(this);
  CompositeTypo get caption1Semibold => _Typos.caption1SemiBold(this);

  CompositeTypo get caption2Light => _Typos.caption2Light(this);
  CompositeTypo get caption2Regular => _Typos.caption2Regular(this);
  CompositeTypo get caption2Medium => _Typos.caption2Medium(this);
  CompositeTypo get caption2Semibold => _Typos.caption2SemiBold(this);
}

class _Typos {
  static CompositeTypo heading1Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.h1),
      TextHeightTypo(context.lineHeight.h1 / context.fontSize.h1),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading1Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.h1),
      TextHeightTypo(context.lineHeight.h1 / context.fontSize.h1),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading1Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.h1),
      TextHeightTypo(context.lineHeight.h1 / context.fontSize.h1),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading1SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.h1),
      TextHeightTypo(context.lineHeight.h1 / context.fontSize.h1),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading2Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.h2),
      TextHeightTypo(context.lineHeight.h2 / context.fontSize.h2),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading2Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.h2),
      TextHeightTypo(context.lineHeight.h2 / context.fontSize.h2),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading2Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.h2),
      TextHeightTypo(context.lineHeight.h2 / context.fontSize.h2),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading2SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.h2),
      TextHeightTypo(context.lineHeight.h2 / context.fontSize.h2),
      LetterSpacingTypo(context.letterSpacing.moreNarrow),
    });
  }

  static CompositeTypo heading3Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.h3),
      TextHeightTypo(context.lineHeight.h3 / context.fontSize.h3),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading3Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.h3),
      TextHeightTypo(context.lineHeight.h3 / context.fontSize.h3),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading3Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.h3),
      TextHeightTypo(context.lineHeight.h3 / context.fontSize.h3),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading3SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.h3),
      TextHeightTypo(context.lineHeight.h3 / context.fontSize.h3),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading4Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.h4),
      TextHeightTypo(context.lineHeight.h4 / context.fontSize.h4),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading4Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.h4),
      TextHeightTypo(context.lineHeight.h4 / context.fontSize.h4),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading4Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.h4),
      TextHeightTypo(context.lineHeight.h4 / context.fontSize.h4),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading4SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.h4),
      TextHeightTypo(context.lineHeight.h4 / context.fontSize.h4),
      LetterSpacingTypo(context.letterSpacing.narrow),
    });
  }

  static CompositeTypo heading5Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.h5),
      TextHeightTypo(context.lineHeight.h5 / context.fontSize.h5),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading5Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.h5),
      TextHeightTypo(context.lineHeight.h5 / context.fontSize.h5),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading5Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.h5),
      TextHeightTypo(context.lineHeight.h5 / context.fontSize.h5),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading5SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.h5),
      TextHeightTypo(context.lineHeight.h5 / context.fontSize.h5),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading6Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.h6),
      TextHeightTypo(context.lineHeight.h6 / context.fontSize.h6),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading6Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.h6),
      TextHeightTypo(context.lineHeight.h6 / context.fontSize.h6),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading6Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.h6),
      TextHeightTypo(context.lineHeight.h6 / context.fontSize.h6),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo heading6SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.h6),
      TextHeightTypo(context.lineHeight.h6 / context.fontSize.h6),
      LetterSpacingTypo(context.letterSpacing.normal),
    });
  }

  static CompositeTypo paragraph1Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.p1),
      TextHeightTypo(context.lineHeight.p1 / context.fontSize.p1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph1Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.p1),
      TextHeightTypo(context.lineHeight.p1 / context.fontSize.p1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph1Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.p1),
      TextHeightTypo(context.lineHeight.p1 / context.fontSize.p1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph1SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.p1),
      TextHeightTypo(context.lineHeight.p1 / context.fontSize.p1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph2Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.p2),
      TextHeightTypo(context.lineHeight.p2 / context.fontSize.p2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph2Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.p2),
      TextHeightTypo(context.lineHeight.p2 / context.fontSize.p2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph2Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.p2),
      TextHeightTypo(context.lineHeight.p2 / context.fontSize.p2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo paragraph2SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.p2),
      TextHeightTypo(context.lineHeight.p2 / context.fontSize.p2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption1Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.c1),
      TextHeightTypo(context.lineHeight.c1 / context.fontSize.c1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption1Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.c1),
      TextHeightTypo(context.lineHeight.c1 / context.fontSize.c1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption1Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.c1),
      TextHeightTypo(context.lineHeight.c1 / context.fontSize.c1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption1SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.c1),
      TextHeightTypo(context.lineHeight.c1 / context.fontSize.c1),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption2Light(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.light),
      FontSizeTypo(context.fontSize.c2),
      TextHeightTypo(context.lineHeight.c2 / context.fontSize.c2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption2Regular(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.regular),
      FontSizeTypo(context.fontSize.c2),
      TextHeightTypo(context.lineHeight.c2 / context.fontSize.c2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption2Medium(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.medium),
      FontSizeTypo(context.fontSize.c2),
      TextHeightTypo(context.lineHeight.c2 / context.fontSize.c2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }

  static CompositeTypo caption2SemiBold(BuildContext context) {
    return CompositeTypo({
      FontWeightTypo(context.fontWeight.semibold),
      FontSizeTypo(context.fontSize.c2),
      TextHeightTypo(context.lineHeight.c2 / context.fontSize.c2),
      LetterSpacingTypo(context.letterSpacing.wide),
    });
  }
}
