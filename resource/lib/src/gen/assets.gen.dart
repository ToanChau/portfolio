// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/env.dev
  String get envDev => 'assets/env/env.dev';

  /// File path: assets/env/env.prod
  String get envProd => 'assets/env/env.prod';

  /// File path: assets/env/env.staging
  String get envStaging => 'assets/env/env.staging';

  /// List of all assets
  List<String> get values => [envDev, envProd, envStaging];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/Huit_elearn.png
  AssetGenImage get huitElearn =>
      const AssetGenImage('assets/png/Huit_elearn.png');

  /// File path: assets/png/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/png/apple.png');

  /// File path: assets/png/cardwordslogo.png
  AssetGenImage get cardwordslogo =>
      const AssetGenImage('assets/png/cardwordslogo.png');

  /// File path: assets/png/me (1).png
  AssetGenImage get me1 => const AssetGenImage('assets/png/me (1).png');

  /// File path: assets/png/me (2).png
  AssetGenImage get me2 => const AssetGenImage('assets/png/me (2).png');

  /// List of all assets
  List<AssetGenImage> get values => [
    huitElearn,
    apple,
    cardwordslogo,
    me1,
    me2,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/ic_back_arrow.svg
  SvgGenImage get icBackArrow =>
      const SvgGenImage('assets/svg/ic_back_arrow.svg');

  /// File path: assets/svg/ic_coupon.svg
  SvgGenImage get icCoupon => const SvgGenImage('assets/svg/ic_coupon.svg');

  /// File path: assets/svg/ic_dart.svg
  SvgGenImage get icDart => const SvgGenImage('assets/svg/ic_dart.svg');

  /// File path: assets/svg/ic_firebase.svg
  SvgGenImage get icFirebase => const SvgGenImage('assets/svg/ic_firebase.svg');

  /// File path: assets/svg/ic_flutter.svg
  SvgGenImage get icFlutter => const SvgGenImage('assets/svg/ic_flutter.svg');

  /// File path: assets/svg/ic_github.svg
  SvgGenImage get icGithub => const SvgGenImage('assets/svg/ic_github.svg');

  /// File path: assets/svg/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/svg/ic_home.svg');

  /// File path: assets/svg/ic_location.svg
  SvgGenImage get icLocation => const SvgGenImage('assets/svg/ic_location.svg');

  /// File path: assets/svg/ic_mail.svg
  SvgGenImage get icMail => const SvgGenImage('assets/svg/ic_mail.svg');

  /// File path: assets/svg/ic_mobile.svg
  SvgGenImage get icMobile => const SvgGenImage('assets/svg/ic_mobile.svg');

  /// File path: assets/svg/ic_notification.svg
  SvgGenImage get icNotification =>
      const SvgGenImage('assets/svg/ic_notification.svg');

  /// File path: assets/svg/ic_paper_plane.svg
  SvgGenImage get icPaperPlane =>
      const SvgGenImage('assets/svg/ic_paper_plane.svg');

  /// File path: assets/svg/ic_phone.svg
  SvgGenImage get icPhone => const SvgGenImage('assets/svg/ic_phone.svg');

  /// File path: assets/svg/ic_python.svg
  SvgGenImage get icPython => const SvgGenImage('assets/svg/ic_python.svg');

  /// File path: assets/svg/ic_qr_noti.svg
  SvgGenImage get icQrNoti => const SvgGenImage('assets/svg/ic_qr_noti.svg');

  /// File path: assets/svg/ic_rocket.svg
  SvgGenImage get icRocket => const SvgGenImage('assets/svg/ic_rocket.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icBackArrow,
    icCoupon,
    icDart,
    icFirebase,
    icFlutter,
    icGithub,
    icHome,
    icLocation,
    icMail,
    icMobile,
    icNotification,
    icPaperPlane,
    icPhone,
    icPython,
    icQrNoti,
    icRocket,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
