import 'package:flutter/material.dart';

const MaterialColor shopfyGreen = MaterialColor(
  0xFF00995D,
  <int, Color>{
    50: Color(0xFFe0f3ec),
    100: Color(0xFFb3e0ce),
    200: Color(0xFF80ccae),
    300: Color(0xFF4db88e),
    400: Color(0xFF26a875),
    500: Color(0xFF00995d),
    600: Color(0xFF009155),
    700: Color(0xFF00864b),
    800: Color(0xFF007c41),
    900: Color(0xFF006b30),
  },
);

const MaterialColor shopfyOrange = MaterialColor(
  0xFFF47920,
  <int, Color>{
    50: Color(0xFFfeefe4),
    100: Color(0xFFfcd7bc),
    200: Color(0xFFfabc90),
    300: Color(0xFFf7a163),
    400: Color(0xFFf68d41),
    500: Color(0xFFf47920),
    600: Color(0xFFf3711c),
    700: Color(0xFFf16618),
    800: Color(0xFFef5c13),
    900: Color(0xFFec490b),
  },
);

const MaterialColor red = MaterialColor(
  0xFFEB5757,
  <int, Color>{
    50: Color.fromRGBO(65, 21, 100, 0.1),
    100: Color.fromRGBO(65, 21, 100, 0.2),
    200: Color.fromRGBO(65, 21, 100, 0.3),
    300: Color.fromRGBO(65, 21, 100, 0.4),
    400: Color.fromRGBO(65, 21, 100, 0.5),
    500: Color.fromRGBO(65, 21, 100, 0.6),
    600: Color.fromRGBO(65, 21, 100, 0.7),
    700: Color.fromRGBO(65, 21, 100, 0.8),
    800: Color.fromRGBO(65, 21, 100, 0.9),
    900: Color.fromRGBO(65, 21, 100, 1),
  },
);

class ShopfyColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color background = Color.fromARGB(255, 249, 249, 249);
  static const Color gray2 = Color.fromARGB(255, 244, 244, 244);
  static const Color red = Color.fromRGBO(235, 87, 87, 1);
  static const Color dark = Color.fromRGBO(36, 36, 36, 1);
  static const Color gray = Color.fromRGBO(144, 144, 144, 1);
  static const Color green = Color.fromRGBO(39, 174, 97, 1);
  static const Color yellow = Color.fromRGBO(242, 201, 77, 1);
}

class ThemeAppWidget {
  static ThemeData purple() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        // ignore: deprecated_member_use
        brightness: Brightness.dark,
      ),
      primarySwatch: red,
      buttonTheme: const ButtonThemeData(
        minWidth: 10,
        buttonColor: red,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.black,
          ),
          headline6: TextStyle(
            color: ShopfyColors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
    );
  }
}

class TextStyles {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: ShopfyColors.dark,
    height: 1.5,
  );

  static const regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ShopfyColors.dark,
  );
  static const red = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ShopfyColors.red,
  );
  static const small = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ShopfyColors.gray,
  );

  static const titleCard = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ShopfyColors.gray,
    height: 1.5,
  );
  static const priceCard = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ShopfyColors.dark,
    height: 1.5,
  );
}
