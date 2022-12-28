import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'TitilliumWeb',
  // primaryColor: Color(0xFF1B7FED),
  primaryColor: Color(0xFFfed700),
  brightness: Brightness.dark,
  highlightColor: Color(0xFF252525),
  hintColor: Color(0xFFc7c7c7),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
// /[4:29 pm, 20/11/2022] Maruf Mehedi Softbd Web: yellow: #fed700
// [4:30 pm, 20/11/2022] Maruf Mehedi Softbd Web: red : ##E80F0F
// [4:30 pm, 20/11/2022] Maruf Mehedi Softbd Web: blue:#5685A4 (add to cart button)
// [4:31 pm, 20/11/2022] Maruf Mehedi Softbd Web: black: #242424 (hover)