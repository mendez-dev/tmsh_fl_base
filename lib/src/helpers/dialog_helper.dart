import '../widgets/buttons_widget.dart';
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
                child: ButtonWidget(
                  isExpanded: true,
                  type: ButtonType.outlined,
                  text: cancelText,
                  onTap: () => Navigator.pop<bool>(context, false),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonWidget(
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

Future<void> showSuccessDialog(
    {required BuildContext context,
    required String title,
    String? description,
    String buttonText = "Aceptar"}) async {
  await Alert(
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
          type: AlertType.success,
          buttons: <DialogButton>[],
          content: Container(
            margin: EdgeInsets.zero,
            // color: Colors.red,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      isExpanded: true,
                      text: buttonText,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          desc: description)
      .show();
}
