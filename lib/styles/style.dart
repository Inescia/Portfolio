import 'package:flutter/material.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

// ignore: non_constant_identifier_names
List<Color> COLORS = [
  Colors.lightGreen.shade800,
  Colors.amber.shade800,
  Colors.red.shade900,
  Colors.purple.shade900,
  Colors.indigo.shade800,
  Colors.cyan.shade700
];

const Padding copyright = Padding(
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    child: Text('© Ines Ciattoni 2021 - 2023',
        textAlign: TextAlign.right,
        style: TextStyle(
            letterSpacing: 2,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w100,
            fontSize: 20)));

List<BoxShadow> shadow = [
  BoxShadow(
      color: Colors.grey.withOpacity(0.5), spreadRadius: 8, blurRadius: 15)
];

Positioned title(String txt, double width, double height, {int num = 0}) {
  double marge = width / 10;
  Color color = Colors.white;
  switch (num) {
    case 1:
      marge = width / 4;
      break;
    case 2:
      marge = width / 2.5;
      break;
    case 3:
      marge = width / 1.8;
      color = Colors.red;
      break;
    case 4:
      marge = width / 1.4;
      break;
    default:
      marge = width / 10;
  }

  return Positioned(
      left: marge,
      top: height / 15,
      bottom: height / 10,
      child: SizedBox(
          height: height,
          child: RotatedBox(
              quarterTurns: 3,
              child: AutoSizeText(txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      shadows: const [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black26,
                          offset: Offset(5.0, 5.0),
                        )
                      ],
                      color: color,
                      fontFamily: 'Allerta Stencil',
                      fontWeight: FontWeight.w700,
                      fontSize: 200,
                      letterSpacing: (height / 45)),
                  maxLines: 1))));
}

Text text(String txt, [TextAlign align = TextAlign.center]) {
  return Text(txt,
      textAlign: align,
      style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          letterSpacing: 1.5,
          height: 2));
}

Widget backTitle(String txt, double width, {Color color = Colors.black26}) {
  return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AutoSizeText(txt,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color,
              fontFamily: 'Allerta Stencil',
              fontWeight: FontWeight.w700,
              fontSize: 220,
              letterSpacing: 30),
          maxLines: 1));
}

Column title2(String txt, Color color) {
  return Column(children: [
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(txt,
            style: TextStyle(
                color: color,
                fontSize: 35,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                letterSpacing: 3))),
    Container(
        width: 150,
        height: 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ))
  ]);
}

Padding title3(String txt, Color color, TextAlign align) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(txt,
          textAlign: align,
          style: TextStyle(
              color: color,
              fontSize: 50,
              fontFamily: 'Bonheur Royale',
              letterSpacing: 3)));
}

Padding textWithIcon(String text, {String? icon}) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (icon != null)
          Padding(
              padding: const EdgeInsets.all(5),
              child: Image(
                  image: AssetImage('assets/icons/$icon.png'), height: 45)),
        Flexible(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(text,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w300))))
      ]));
}

class ChartData {
  final String x;
  final num y;
  ChartData(this.x, this.y);
}

ThemeData appTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Oswald',
        fontWeight: FontWeight.w500,
        fontSize: 40,
        letterSpacing: 1.3,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontFamily: 'Open sans',
        fontWeight: FontWeight.w300,
        fontSize: 15,
        letterSpacing: 1.3,
      ),
    ),
    primaryColor: const Color.fromRGBO(255, 255, 255, 1),
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(5),
          shadowColor: MaterialStateProperty.all<Color>(Colors.pink),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: Colors.pink, width: 3)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.pink, width: 3)),
          )),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
