import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final Color? cancelTextColor;
  final Color? confirmTextColor;
  final String? textConfirm;
  final String? textCancel;
  final Color? backgroundColo;
  final Color? buttonColor;
  final String text;
  final TextStyle? styleText;
  final List<Widget>? actions;

  DefaultDialog({
    this.styleText,
    this.onCancel,
    this.backgroundColo,
    required this.text,
    required this.title,
    this.titleStyle,
    this.onConfirm,
    this.cancelTextColor,
    this.confirmTextColor,
    this.textConfirm,
    this.textCancel,
    this.buttonColor,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: Column(children: [
        Container(
          height: 20,
          child: Text(this.title),
        ),
        Container(
          height: 80,
          child: Text(this.text),
        ),
        Row(
          
        )
      ],),

    );
  }
}
