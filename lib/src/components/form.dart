import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  

  final String? label;
  final IconData? icon;
  final InputTextStyle type;
  final String Function(String? value)? validator;

  const InputText({Key? key, this.label, this.icon, this.type = InputTextStyle.standar, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (type == InputTextStyle.circularBorder) {
      return FormField(
        validator: validator,
        builder: (FormFieldState formFieldState){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: type == InputTextStyle.circularBorder ? const EdgeInsets.symmetric(horizontal: 15, vertical: 5) : null,
                decoration: type == InputTextStyle.circularBorder ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: const Color(0xffB7C7C7),
                    width: 2
                  )
                ) : null,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  decoration: _getDecoration(),
                ),
              ),
              if (formFieldState.hasError) ...[
                Row(
                  children: [
                    const SizedBox(width: 25),
                    Expanded(child: Text(formFieldState.errorText!, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle( fontSize: 11, color: Colors.red))),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 10)
              ]
            ],
          );
        } 
      );
    }

    return TextFormField(
      validator: validator,
      decoration: _getDecoration(),
    );


  }

  InputDecoration _getDecoration() {

    switch (type) {
      case InputTextStyle.bordered:
        return InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          icon: icon != null ? Icon(icon) : null,
          label: label != null ? Text(label!) : null
        );
      case InputTextStyle.circularBorder:
        return InputDecoration(
          border: InputBorder.none,
          icon: icon != null ? Icon(icon) : null,
          hintText: label
        );
      default:
        return InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          label: label != null ? Text(label!) : null
        );
    }

  }
}

enum InputTextStyle {
  standar,
  bordered,
  circularBorder
}