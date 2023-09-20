import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals.dart';

TextStyle ptSansTextStyle({
  bool inherit = true,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  TextLeadingDistribution? leadingDistribution,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  List<FontVariation>? fontVariations,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
  String? debugLabel,
  String? fontFamily,
  List<String>? fontFamilyFallback,
  String? package,
  TextOverflow? overflow,
}) {
  final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
  return GoogleFonts.ptSans(
    textStyle: TextStyle(
        wordSpacing: wordSpacing,
        fontFeatures: fontFeatures,
        fontFamilyFallback: fontFamilyFallback,
        textBaseline: textBaseline,
        shadows: shadows,
        fontVariations: fontVariations,
        package: package,
        inherit: inherit,
        foreground: foreground,
        letterSpacing: letterSpacing,
        leadingDistribution: leadingDistribution,
        fontStyle: fontStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        background: background,
        debugLabel: debugLabel,
        decoration: decoration,
        backgroundColor: backgroundColor,
        locale: locale,
        overflow: overflow,
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color),
  );
}

Text CommonText({
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior,
  Color? selectionColor,
  required String text,
  required TextStyle style,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: style,
    overflow: overflow,
    locale: locale,
    maxLines: maxLines,
    selectionColor: selectionColor,
    semanticsLabel: semanticsLabel,
    softWrap: softWrap,
    strutStyle: strutStyle,
    textDirection: textDirection,
    textHeightBehavior: textHeightBehavior,
    textScaleFactor: textScaleFactor,
    textWidthBasis: textWidthBasis,
  );
}
