import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  

  final String? label;
  final IconData? icon;
  final InputTextType type;
  final String Function(String? value)? validator;

  const InputText({Key? key, this.label, this.icon, this.type = InputTextType.standar, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (type == InputTextType.circularBorder) {
      return FormField(
        validator: validator,
        builder: (FormFieldState formFieldState){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: type == InputTextType.circularBorder ? const EdgeInsets.symmetric(horizontal: 15, vertical: 5) : null,
                decoration: type == InputTextType.circularBorder ? BoxDecoration(
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
      case InputTextType.bordered:
        return InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          icon: icon != null ? Icon(icon) : null,
          label: label != null ? Text(label!) : null
        );
      case InputTextType.circularBorder:
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

enum InputTextType {
  standar,
  bordered,
  circularBorder
}