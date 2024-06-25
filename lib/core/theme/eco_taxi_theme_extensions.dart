import 'package:flutter/material.dart';

import 'colors.dart';

/// Used to add the Christy highlight colors to the application material theme
class EcoTaxiThemeExtension extends ThemeExtension<EcoTaxiThemeExtension> {
  final Color highlight1;
  final Color highlight2;
  final Color highlight3;
  final Color highlight4;
  final Color highlight5;
  final Color highlight6;

  const EcoTaxiThemeExtension({
    required this.highlight1,
    required this.highlight2,
    required this.highlight3,
    required this.highlight4,
    required this.highlight5,
    required this.highlight6,
  });

  // Generates the Christy theme extension from the color palette
  factory EcoTaxiThemeExtension.fromPalette(EcoTaxiColorPalette palette) {
    return EcoTaxiThemeExtension(
      highlight1: palette.highlight1,
      highlight2: palette.highlight2,
      highlight3: palette.highlight3,
      highlight4: palette.highlight4,
      highlight5: palette.highlight5,
      highlight6: palette.highlight6,
    );
  }

  @override
  ThemeExtension<EcoTaxiThemeExtension> copyWith({
    Color? highlight1,
    Color? highlight2,
    Color? highlight3,
    Color? highlight4,
    Color? highlight5,
    Color? highlight6,
  }) {
    return EcoTaxiThemeExtension(
      highlight1: highlight1 ?? this.highlight1,
      highlight2: highlight1 ?? this.highlight2,
      highlight3: highlight1 ?? this.highlight3,
      highlight4: highlight1 ?? this.highlight4,
      highlight5: highlight1 ?? this.highlight5,
      highlight6: highlight1 ?? this.highlight6,
    );
  }

  /// Don't know what this does but it's just related to the material theme extensions
  @override
  ThemeExtension<EcoTaxiThemeExtension> lerp(ThemeExtension<EcoTaxiThemeExtension>? other, double t) {
    if (other is! EcoTaxiThemeExtension) {
      return this;
    }
    return EcoTaxiThemeExtension(
      highlight1: Color.lerp(highlight1, other.highlight1, t)!,
      highlight2: Color.lerp(highlight2, other.highlight2, t)!,
      highlight3: Color.lerp(highlight3, other.highlight3, t)!,
      highlight4: Color.lerp(highlight4, other.highlight4, t)!,
      highlight5: Color.lerp(highlight5, other.highlight5, t)!,
      highlight6: Color.lerp(highlight6, other.highlight6, t)!,
    );
  }
}
