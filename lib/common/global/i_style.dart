import 'package:flutter/material.dart';

///颜色
class IColors {
  static const int primaryIntValue = 0xFFFF8E9F;

  static const MaterialColor primarySwatch = MaterialColor(
    primaryIntValue,
    <int, Color>{
      50: Color(primaryIntValue),
      100: Color(primaryIntValue),
      200: Color(primaryIntValue),
      300: Color(primaryIntValue),
      400: Color(primaryIntValue),
      500: Color(primaryIntValue),
      600: Color(primaryIntValue),
      700: Color(primaryIntValue),
      800: Color(primaryIntValue),
      900: Color(primaryIntValue),
    },
  );

  static const String primaryValueString = '#f9d78f';
  static const String primaryLightValueString = '#42464b';
  static const String primaryDarkValueString = '#121917';
  static const String miWhiteString = '#ececec';
  static const String actionBlueString = '#267aff';
  static const String webDraculaBackgroundColorString = '#282a36';

  static const Color accentColor = Color(0xFFFFB600);
  static const Color primaryShadow = Color(0xFFFFB600);
  static const Color shadowColor = Color(0x60fcfcfc);
  static const Color halfBlackColor = Color(0x80000000);
  static const Color labelGreenColor = Color(0xff099F7F);
  static const Color grayColor = Color(0xffF0F0F0);
  static const Color lineColor = Color(0xffF0F0F0);
  static const Color inputBackground = Color(0xffF5F5F5);
  static const Color avatarBorderColor = grayColor;
  static const Color unselectedText = Color(0xff62480B);

  static const Color primaryValue = Color(0xFF0753f9);
  static const Color primaryLightValue = Color(0xFF0753f9);
  static const Color primaryDarkValue = Color(0xFF0753f9);
  static const Color primaryDarkPressValue = Color(0xff099F7F);
  static const Color halfPrimaryDarkValue = Color(0xff099F7F);
  static const Color backgroundColor = Colors.white;
  static const Color subTextColor = Color(0xff333333);
  static const Color subLightTextColor = Color(0xff666666);
  static const Color lineTextColor = Color(0xff999999);
  static const Color uselessColor = Color(0xffebeceb);
  static const Color hLineColor = Color(0xffe2e2e2);
  static const Color starColor = Color(0xffE11882);
  static const Color upColor = Color(0xffBA4531);
  static const Color downColor = Color(0xff478c34);
  static const Color orange = Color(0xffD7632E);
  static const Color commBorder = Color(0xffD6D6D6);
  static const Color hot = Color(0xffBA4531);
  static const Color favorite = Color(0xffE18918);
  static const Color white = Color(0xffffffff);

  static const Color tabBorderColor = Color(0xffcccccc);

  static const Color mainTextColor = Colors.black87;
  static const Color primaryTextColor = Color(0xFFF6C30A);
  static const Color secondTextColor = Color(0xFFD8B760);
  static const Color buyColor = Color(0xFFFFF8EE);
  static const Color saleColor = Color(0xFFF2F2FF);

  static const Color gradientStart = Color(0xFF7178FF);
  static const Color gradientEnd = Color(0xFF3C45F3);

  static const List<Color> gradientBg = <Color>[
    Color(0xFF7178FF),
    Color(0xFF3C45F3)
  ];

  static const LinearGradient gradientLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: IColors.gradientBg,
  );

  static const LinearGradient appbarGradientLinear = LinearGradient(
      end: Alignment.centerLeft,
      begin: Alignment.centerRight,
      colors: IColors.gradientBg);

  static const Color color_1 = primarySwatch;
  static const Color color_2 = Color(0xFF5FD0DF);
  static const Color color_3 = Color(0xFFFFB600);
  static const Color color_4 = Color(0xFFFF8E9F);
}

///文本样式
class IConstant {
  static const double lagerTextSize = 18.0;
  static const double bigTextSize = 15.0;
  static const double normalTextSize = 15.0;
  static const double middleTextSize = 14.0;
  static const double smallTextSize = 12.0;
  static const double minTextSize = 10.0;
  static const double leastTextSize = 8.0;

  static const TextStyle mainTextStyle = TextStyle(
    color: IColors.primaryTextColor,
    fontSize: middleTextSize,
  );

  static const TextStyle mainTextSmallStyle = TextStyle(
    color: IColors.primaryTextColor,
    fontSize: smallTextSize,
  );

  static const TextStyle mainTextWhite = TextStyle(
    color: Colors.white,
    fontSize: middleTextSize,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: IColors.subTextColor,
    fontSize: bigTextSize,
  );

  static const TextStyle titleTextBold = TextStyle(
      color: IColors.mainTextColor,
      fontSize: bigTextSize,
      fontWeight: FontWeight.bold);

  static const TextStyle titleTextWhite = TextStyle(
    color: Colors.white,
    fontSize: bigTextSize,
  );

  static const TextStyle normalTextWhite = TextStyle(
    color: Colors.white,
    fontSize: normalTextSize,
  );

  static const TextStyle normalText = TextStyle(
    color: IColors.subLightTextColor,
    fontSize: normalTextSize,
  );

  static const TextStyle normalTextTitle = TextStyle(
    color: IColors.subTextColor,
    fontSize: normalTextSize,
  );

  static const TextStyle normalTextBold = TextStyle(
      color: IColors.subTextColor,
      fontSize: normalTextSize,
      fontWeight: FontWeight.bold);

  static const TextStyle middleText = TextStyle(
    color: IColors.subTextColor,
    fontSize: middleTextSize,
  );

  static const TextStyle middleTextBold = TextStyle(
      color: IColors.subTextColor,
      fontSize: middleTextSize,
      fontWeight: FontWeight.bold);

  static const TextStyle middleTextPrimary =
      TextStyle(color: IColors.primarySwatch, fontSize: middleTextSize);

  static const TextStyle smallTextPrimary =
      TextStyle(color: IColors.primarySwatch, fontSize: smallTextSize);

  static const TextStyle middleSubText = TextStyle(
    color: IColors.subLightTextColor,
    fontSize: middleTextSize,
  );

  static const TextStyle likeSubText = TextStyle(
    color: IColors.hot,
    fontSize: middleTextSize,
  );

  static const TextStyle actionText = TextStyle(
    color: IColors.downColor,
    fontSize: middleTextSize,
  );

  static const TextStyle middleTextWhite = TextStyle(
    color: Colors.white,
    fontSize: middleTextSize,
  );

  static const TextStyle smallTextWhite = TextStyle(
    color: Colors.white,
    fontSize: smallTextSize,
  );

  static const TextStyle smallText = TextStyle(
    color: IColors.subLightTextColor,
    fontSize: smallTextSize,
  );

  static const TextStyle smallTextBold = TextStyle(
      color: IColors.subLightTextColor,
      fontSize: smallTextSize,
      fontWeight: FontWeight.bold);

  static const TextStyle indicatorSelectedTextStyle = TextStyle(
    color: IColors.mainTextColor,
    fontSize: bigTextSize,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle indicatorUnSelectedTextStyle = TextStyle(
    color: IColors.subTextColor,
    fontSize: normalTextSize,
  );

  static const TextStyle minTextStyle = TextStyle(
    color: IColors.mainTextColor,
    fontSize: minTextSize,
  );
}
