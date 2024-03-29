import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final InputTextStyle type;
  final String? Function(String?)? validator;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final bool? enabled;
  final bool obscureText;
  final void Function(String)? onChanged;

  const InputTextWidget(
      {Key? key,
      this.label,
      this.icon,
      this.controller,
      this.type = InputTextStyle.standard,
      this.validator,
      this.margin,
      this.enabled = true,
      this.obscureText = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscureText,
        enabled: enabled,
        controller: controller,
        validator: validator,
        decoration: _getDecoration(context),
      ),
    );
  }

  InputDecoration _getDecoration(BuildContext context) {
    switch (type) {
      case InputTextStyle.bordered:
        return InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Theme.of(context).textTheme.bodyText1!.color!)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            icon: icon != null ? Icon(icon) : null,
            label: label != null ? Text(label!) : null);
      case InputTextStyle.circularBorder:
        return InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                    color: Theme.of(context).textTheme.bodyText1!.color!)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            prefixIcon: icon != null ? Icon(icon) : null,
            hintText: label);
      default:
        return InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).textTheme.bodyText1!.color!)),
            icon: icon != null ? Icon(icon) : null,
            label: label != null ? Text(label!) : null);
    }
  }
}

enum InputTextStyle { standard, bordered, circularBorder }
