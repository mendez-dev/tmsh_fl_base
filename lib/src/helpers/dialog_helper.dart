import '../components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool> showConfirmationDialog(
    {required BuildContext context,
    required String title,
    String cancelText = "Cancelar",
    String confirmText = "Aceptar",
    String? description}) async {
  bool? response = await Alert(
      style: AlertStyle(
          descStyle: Theme.of(context).textTheme.bodyText2 ??
              const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
          titleStyle: Theme.of(context).textTheme.headline5 ??
              const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal),
          buttonAreaPadding: const EdgeInsets.only(bottom: 20)),
      context: context,
      title: title,
      type: AlertType.info,
      buttons: <DialogButton>[],
      desc: description,
      content: Container(
        margin: EdgeInsets.zero,
        // color: Colors.red,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Expanded(
                child: Button(
                  isExpanded: true,
                  type: ButtonType.outline,
                  text: cancelText,
                  onTap: () => Navigator.pop<bool>(context, false),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Button(
                  isExpanded: true,
                  text: confirmText,
                  onTap: () => Navigator.pop<bool>(context, true),
                ),
              ),
            ],
          ),
        ),
      )).show();

  if (response != null) {
    return response;
  }

  return false;
}
