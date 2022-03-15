import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final CustomButtomType type;
  final Function()? onTap;
  const LoginButton({ Key? key, required this.text, this.type = CustomButtomType.standar, this.onTap }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap ?? (){},
      child: Container(
        decoration: _getDecorationBorder(type, context),
        padding: const EdgeInsets.all(15),
        child:  Center(
          child: Text(text, style: _getTextStyle(type, context),),
        ),
      ),
    );
  }
}

enum CustomButtomType {
  standar,
  outline
}

BoxDecoration _getDecorationBorder(CustomButtomType type, BuildContext context){
  switch (type) {
    
    case CustomButtomType.outline:
    return BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2
        ),
        borderRadius: BorderRadius.circular(50)
      );
    default:
      return BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(50)
      );
  }
}

TextStyle _getTextStyle(CustomButtomType type, BuildContext context) {
  switch (type) {
    
    case CustomButtomType.outline:
    return  TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16);
    default:
      return const TextStyle(color: Colors.white, fontSize: 16);
  }
}