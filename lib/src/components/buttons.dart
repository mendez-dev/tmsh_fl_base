import 'package:flutter/material.dart';

/// Boton personalizado y configurable
/// 
/// El objetivo de este widget es que pueda cumplir con todas
/// las necesidades al momento de usar un botón sin requrir a
/// la creacion de un widget adicional.
/// 
/// Es configurable y se le pueden definir diferentes estilos
/// y comportamientos.
class Button extends StatelessWidget {

  /// [String] Texto que se mostrara dentro del botón
  final String text;

  /// [ButtonType] Indica el tipo del boton si es standar u outline
  final ButtonType type;

  /// [Function()?] Funcion que se ejecutara al precionar el botón
  final Function()? onTap;

  /// [BorderRadius] reemplaza el borderRadius por defecto del boton
  /// si se indica la propiedad isRounded = `true` y borderRadius != `null`
  /// se dara prioridad el borde indicado en borderRedius
  final BorderRadius? borderRadius;

  /// [bool] Indica si el botón se expandira horizontalmente para tomar
  /// el espacio disponible
  final bool isExpanded;

  /// [bool] Indica si el boton tendra un estilo completamente redondeado
  final bool isRounded;

  /// [Color] Define el color del boton si no se establece uno se tomara
  /// color principal del tema de la aplicacion
  final Color? color;

  /// [bool] Si es `true` mostrara un CircularProgressIndicator en lugar
  /// de el botón
  final bool isLoading;

  const Button(
      {Key? key,
      required this.text,
      this.type = ButtonType.standar,
      this.onTap,
      this.borderRadius,
      this.isExpanded = false,
      this.isRounded = false,
      this.color,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      width: isExpanded ? double.infinity : null,
      child: isLoading ? const CircularProgressIndicator() : _getButtonType(context),
    );
  }

  /// Retorna el widget correspondiente al tipo de boton
  /// 
  /// Si no se a indicado un tipo de botón se retorna un
  /// widget del tipo [ElevatedButton]
  Widget _getButtonType(BuildContext context) {
    switch (type) {
      case ButtonType.outline:
        return OutlinedButton(
            style: _getButtonStyle(context),
            onPressed: onTap,
            child: _getText(context));
      default:
        return ElevatedButton(
            style: _getButtonStyle(context),
            onPressed: onTap,
            child: _getText(context));
    }
  }

  /// Retorna el estilo del bóton de acuerdo al tipo selecionado
  /// 
  /// Identifica el tipo de botón y genera un estilo de acuerdo
  /// a cada tipo
  ButtonStyle _getButtonStyle(BuildContext context) {
    switch (type) {
      case ButtonType.outline:
        return OutlinedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(borderRadius: _getBorderRaius()),
            side: BorderSide(color: color ?? Theme.of(context).primaryColor));

      default:
        return ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(borderRadius: _getBorderRaius()));
    }
  }

  /// Retorna el estilo del texto de acuerdo al tipo de boton
  ///
  /// Si el botón es de tipo standar retornara un color de texto blanco
  /// ya que tiene un background con un color solido
  ///
  /// Si el botón es de tipo outline retornara un texto del color del botón.
  TextStyle _getTextStyle(BuildContext context) {
    switch (type) {
      case ButtonType.outline:
        return TextStyle(
            color: color ?? Theme.of(context).colorScheme.primary,
            fontSize: 16);
      default:
        return const TextStyle(color: Colors.white, fontSize: 16);
    }
  }

  /// Retorna un widget de tipo Text con el texto del botón
  Text _getText(BuildContext context) {
    return Text(text, style: _getTextStyle(context));
  }

  /// Retorna el borde radio del botón
  /// 
  /// Si se ha definido un borderRadius espesífico se retornara este,
  /// si no evaluare si la propiedad rounded es verdadera y si no 
  /// retornara un border radius circular ed 5 pixeles
  BorderRadius _getBorderRaius() {
    if (borderRadius != null ) {
      return borderRadius!;
    } else if (isRounded) {
      return BorderRadius.circular(50);
    } else {
      return BorderRadius.circular(5);
    }
  }
}

enum ButtonType { standar, outline }
