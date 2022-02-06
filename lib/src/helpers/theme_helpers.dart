import 'package:base/src/bloc/bloc/settings_bloc.dart';
import 'package:base/src/models/settings_model.dart';
import 'package:base/src/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsHelper {
  final SettingsModel settingsModel;

  ColorsHelper({required this.settingsModel});

  Color mainColor(double opacity) {
    try {
      return Color(int.parse(settingsModel.mainColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color secondColor(double opacity) {
    try {
      return Color(int.parse(settingsModel.secondColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color accentColor(double opacity) {
    try {
      return Color(int.parse(settingsModel.accentColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color mainDarkColor(double opacity) {
    try {
      return Color(
              int.parse(settingsModel.mainDarkColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color secondDarkColor(double opacity) {
    try {
      return Color(
              int.parse(settingsModel.secondDarkColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color accentDarkColor(double opacity) {
    try {
      return Color(
              int.parse(settingsModel.accentDarkColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }

  Color scaffoldColor(double opacity) {
    // TODO test if brightness is dark or not
    try {
      return Color(
              int.parse(settingsModel.scaffoldColor.replaceAll("#", "0xFF")))
          .withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity);
    }
  }
}

ThemeData getThemeData(
    {required BuildContext context, required ThemeModel theme}) {
  // Obtenemos la paleta de colores desde el Settings bloc por medio del context
  ColorsHelper colors = ColorsHelper(
      settingsModel: BlocProvider.of<SettingsBloc>(context).state.settings!);

  final Map<ThemeModel, ThemeData> themesData = {
    ThemeModel.light: _lightTheme(context, colors),
    ThemeModel.dark: _darkTheme(context, colors),
  };

  return themesData[theme]!;
}

ThemeData _lightTheme(BuildContext context, ColorsHelper colors) {
  final ThemeData theme = ThemeData();

  return ThemeData(
    appBarTheme: AppBarTheme(color: colors.mainColor(1)),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: colors.secondColor(1)),
    fontFamily: 'Poppins',
    primaryColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: theme.colorScheme.copyWith(secondary: colors.secondColor(1)),
    focusColor: colors.accentColor(1),
    hintColor: colors.secondColor(1),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 20.0, color: colors.secondColor(1)),
      headline2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: colors.secondColor(1)),
      headline3: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: colors.secondColor(1)),
      headline4: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          color: colors.mainColor(1)),
      headline5: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w300,
          color: colors.secondColor(1)),
      headline6: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: colors.secondColor(1)),
      subtitle1: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: colors.mainColor(1)),
      bodyText1: TextStyle(fontSize: 12.0, color: colors.secondColor(1)),
      bodyText2: TextStyle(fontSize: 14.0, color: colors.secondColor(1)),
      caption: TextStyle(fontSize: 12.0, color: colors.accentColor(1)),
    ),
  );
}

ThemeData _darkTheme(BuildContext context, ColorsHelper colors) {
  return ThemeData(brightness: Brightness.dark);
}
