import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdStyle {
  const NativeAdStyle({
    required this.textStyleHeadline,
    required this.textStyleBody,
    required this.backgroundColor,
    required this.ctaBackgroundColor,
    required this.ctaTextStyle,
  });

  static const String factoryId = 'appNativeAd';

  final NativeTemplateTextStyle textStyleHeadline;
  final NativeTemplateTextStyle textStyleBody;
  final Color backgroundColor;
  final Color ctaBackgroundColor;
  final NativeTemplateTextStyle ctaTextStyle;

  /// Serialises style into the [customOptions] map consumed by [NativeAdFactory] on Android.
  Map<String, Object> toCustomOptions() => {
        'headlineFontSize': textStyleHeadline.size ?? 14.0,
        'headlineFontColor': (textStyleHeadline.textColor ?? Colors.black).toARGB32(),
        'headlineFontWeight': textStyleHeadline.style?.name ?? NativeTemplateFontStyle.bold.name,
        'bodyFontSize': textStyleBody.size ?? 8.0,
        'bodyFontColor': (textStyleBody.textColor ?? Colors.grey).toARGB32(),
        'bodyFontWeight': textStyleBody.style?.name ?? NativeTemplateFontStyle.normal.name,
        'backgroundColor': backgroundColor.toARGB32(),
        'ctaBackgroundColor': ctaBackgroundColor.toARGB32(),
        'ctaFontSize': ctaTextStyle.size ?? 16.0,
        'ctaFontColor': (ctaTextStyle.textColor ?? Colors.white).toARGB32(),
        'ctaFontWeight': ctaTextStyle.style?.name ?? NativeTemplateFontStyle.bold.name,
      };
}
