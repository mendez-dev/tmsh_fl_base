import 'package:flutter/material.dart';

/// Botón personalizado y configurable
///
/// El objetivo de este widget es que pueda cumplir con todas
/// las necesidades al momento de usar un botón sin requerir a
/// la creación de un widget adicional.
///
/// Es configurable y se le pueden definir diferentes estilos
/// y comportamientos.
class ButtonWidget extends StatelessWidget {
  /// Icono que se mostrará en el botón antes del texto
  final IconData? prependIcon;

  /// Icono que se mostrará en el botón después del texto
  final IconData? appendIcon;

  final MainAxisAlignment mainAxisAlignment;

  /// [String] Texto que se mostrara dentro del botón
  final String text;

  /// [ButtonType] Indica el tipo del botón si es standard u outlined
  final ButtonType type;

  /// [Function()?] Función que se ejecutara al presionar el botón
  final Function()? onTap;

  /// [BorderRadius] reemplaza el borderRadius por defecto del botón
  /// si se indica la propiedad isRounded = `true` y borderRadius != `null`
  /// se dará prioridad el borde indicado en borderRedius
  final BorderRadius? borderRadius;

  /// [bool] Indica si el botón se expandirá horizontalmente para tomar
  /// el espacio disponible
  final bool isExpanded;

  /// [bool] Indica si el botón tendrá un estilo completamente redondeado
  final bool isRounded;

  /// [Color] Define el color del botón si no se establece uno se tomara
  /// color principal del tema de la aplicación
  final Color? color;

  /// [bool] Si es `true` mostrara un CircularProgressIndicator en lugar
  /// de el botón
  final bool isLoading;

  final EdgeInsets? padding;

  const ButtonWidget(
      {Key? key,
      this.text = "",
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.prependIcon,
      this.appendIcon,
      this.type = ButtonType.standard,
      this.onTap,
      this.borderRadius,
      this.isExpanded = false,
      this.isRounded = false,
      this.color,
      this.isLoading = false,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      width: isExpanded ? double.infinity : null,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _getButtonType(context),
    );
  }

  /// Retorna el widget correspondiente al tipo de botón
  ///
  /// Si no se a indicado un tipo de botón se retorna un
  /// widget del tipo [ElevatedButton]
  Widget _getButtonType(BuildContext context) {
    switch (type) {
      case ButtonType.outlined:
        return OutlinedButton(
            style: _getButtonStyle(context),
            onPressed: onTap,
            child: SizedBox(
              child: Wrap(
                children: [
                  if (prependIcon != null) _getPrependIcon(context),
                  if (text.isNotEmpty) _getText(context),
                  if (appendIcon != null) _getAppendIcon(context),
                ],
              ),
            ));
      default:
        return ElevatedButton(
            style: _getButtonStyle(context),
            onPressed: onTap,
            child: Wrap(
              children: [
                if (prependIcon != null) _getPrependIcon(context),
                if (text.isNotEmpty) _getText(context),
                if (appendIcon != null) _getAppendIcon(context),
              ],
            ));
    }
  }

  Container _getAppendIcon(BuildContext context) {
    return Container(
      margin: text.isNotEmpty ? const EdgeInsets.only(left: 10) : null,
      child: Icon(
        appendIcon,
        color: type == ButtonType.outlined
            ? Theme.of(context).primaryColor
            : Colors.white,
      ),
    );
  }

  Container _getPrependIcon(BuildContext context) {
    return Container(
      margin: text.isNotEmpty ? const EdgeInsets.only(right: 10) : null,
      child: Icon(
        prependIcon,
        color: type == ButtonType.outlined
            ? Theme.of(context).primaryColor
            : Colors.white,
      ),
    );
  }

  /// Retorna el estilo del botón de acuerdo al tipo seleccionado
  ///
  /// Identifica el tipo de botón y genera un estilo de acuerdo
  /// a cada tipo
  ButtonStyle _getButtonStyle(BuildContext context) {
    switch (type) {
      case ButtonType.outlined:
        return OutlinedButton.styleFrom(
            padding: padding,
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: _getBorderRaius()),
            side: BorderSide(color: color ?? Theme.of(context).primaryColor));

      default:
        return ElevatedButton.styleFrom(
            padding: padding,
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: _getBorderRaius()));
    }
  }

  /// Retorna el estilo del texto de acuerdo al tipo de botón
  ///
  /// Si el botón es de tipo standard retornara un color de texto blanco
  /// ya que tiene un background con un color solido
  ///
  /// Si el botón es de tipo outlined retornara un texto del color del botón.
  TextStyle _getTextStyle(BuildContext context) {
    switch (type) {
      case ButtonType.outlined:
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
  /// Si se ha definido un borderRadius específico se retornara este,
  /// si no evaluare si la propiedad rounded es verdadera y si no
  /// retornara un border radius circular ed 5 pixeles
  BorderRadius _getBorderRaius() {
    if (borderRadius != null) {
      return borderRadius!;
    } else if (isRounded) {
      return BorderRadius.circular(50);
    } else {
      return BorderRadius.circular(5);
    }
  }
}

enum ButtonType { standard, outlined }
